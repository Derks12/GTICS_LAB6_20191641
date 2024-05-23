package org.example.lab7.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name= "prestamos")
public class Prestamos {
    @Id
    @Column(name="idprestamos")
    private Integer idprestamos;
    @Column
    private String fechainicio;
    @Column
    private String fechafin;



}