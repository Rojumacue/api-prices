package com.product.apiprices.model;

import jakarta.persistence.*;

import java.util.Set;

@Entity
@Table(name = "price_list")
public class PriceList {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "name", length = 100, nullable = false)
    private String name;

    @OneToMany(mappedBy = "priceList")
    private Set<Prices> prices;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<Prices> getPrices() {
        return prices;
    }

    public void setPrices(Set<Prices> prices) {
        this.prices = prices;
    }
}
