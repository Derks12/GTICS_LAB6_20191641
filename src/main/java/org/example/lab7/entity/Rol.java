package org.example.lab7.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name= "rol")
public class Rol {
    @Id
    @Column(name="idrol")
    private Integer idrol;
    @Column
    private String nombre;
}
