package org.example.lab7.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name= "dispositivos")
public class Dispositivos {
    @Id
    @Column(name="iddispositivos")
    private Integer iddispositivos;
    @Column
    private String nombre;
    @Column
    private String cantidad;
}
