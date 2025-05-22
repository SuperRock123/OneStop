package com.example.common.config;

import com.example.entity.Goods;
import com.github.benmanes.caffeine.cache.Cache;
import com.github.benmanes.caffeine.cache.Caffeine;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.List;
import java.util.concurrent.TimeUnit;

@Configuration
public class CaffeineConfig {
    @Bean
    public Cache<Integer, Goods> goodsCache() {
        return Caffeine.newBuilder()
                .expireAfterWrite(20, TimeUnit.SECONDS)
                .maximumSize(1000)
                .build();
    }

    @Bean
    public Cache<String, List<Goods>> topGoodsCache() {
        return Caffeine.newBuilder()
                .expireAfterWrite(20, TimeUnit.SECONDS)
                .maximumSize(100)
                .build();
    }
}
