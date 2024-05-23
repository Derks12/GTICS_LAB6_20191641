package org.example.lab7.entity;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Entity
@Getter
@Setter
@Table(name = "usuario")
public class Usuario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_usuario;
    private String nombre;
    private String email;
    private String password;

    @ManyToOne
    @JoinColumn(name="rol_idrol1")
    private Rol rol;

    @ManyToOne
    @JoinColumn(name = "prestamos_idprestamos")
    private Prestamos prestamos;

}
