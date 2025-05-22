package com.example.controller;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.lang.Dict;
import com.example.common.Result;
import com.example.service.MinioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

@RestController
// @RequestMapping("/minio/files")
@RequestMapping("/files")
public class MinioController {

    @Autowired
    private MinioService minioService;

    @Value("${minio.endpoint:http://127.0.0.1:9000}")
    private String endpoint;

    /**
     * 文件上传
     */
    @PostMapping("/upload")
    public Result upload(MultipartFile file) {
        String flag = System.currentTimeMillis() + "-" + file.getOriginalFilename();
        try {
            minioService.upload(file, flag);
            String url = minioService.getFileUrl(flag, endpoint);
            return Result.success(url);
        } catch (Exception e) {
            return Result.error("文件上传失败: " + e.getMessage(), flag);
        }
    }

    /**
     * 获取文件
     */
    @GetMapping("/{flag}")
    public void download(@PathVariable String flag, HttpServletResponse response) {
        try (InputStream is = minioService.download(flag)) {
            response.addHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(flag, "UTF-8"));
            response.setContentType("application/octet-stream");
            OutputStream os = response.getOutputStream();
            byte[] buffer = new byte[8192];
            int len;
            while ((len = is.read(buffer)) != -1) {
                os.write(buffer, 0, len);
            }
            os.flush();
        } catch (Exception e) {
            System.out.println("文件下载失败: " + e.getMessage());
        }
    }

    /**
     * 删除文件
     */
    @DeleteMapping("/{flag}")
    public Result delete(@PathVariable String flag) {
        try {
            minioService.delete(flag);
            return Result.success();
        } catch (Exception e) {
            return Result.error("删除失败: " + e.getMessage(), flag);
        }
    }

    /**
     * wang-editor编辑器文件上传接口
     */
    @PostMapping("/wang/upload")
    public Map<String, Object> wangEditorUpload(MultipartFile file) {
        String flag = System.currentTimeMillis() + "-" + file.getOriginalFilename();
        Map<String, Object> resMap = new HashMap<>();
        try {
            minioService.upload(file, flag);
            String url = minioService.getFileUrl(flag, endpoint);
            resMap.put("errno", 0);
            resMap.put("data", CollUtil.newArrayList(Dict.create().set("url", url)));
        } catch (Exception e) {
            resMap.put("errno", 1);
            resMap.put("message", "上传失败: " + e.getMessage());
        }
        return resMap;
    }
}
