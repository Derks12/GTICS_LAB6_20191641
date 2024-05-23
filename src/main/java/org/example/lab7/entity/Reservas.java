package org.example.lab7.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name= "reservas")
public class Reservas {
    @EmbeddedId
    private ReservasDetalles id;

    @MapsId("iddispositivos")
    @ManyToOne
    @JoinColumn(name="dispositivos_iddispositivos")
    private Dispositivos iddispositivos;

    @MapsId("idUsuario")
    @ManyToOne
    @JoinColumn(name="idUsuario")
    private Usuario idUsuario;

    @Column
    private String fechainicio;
    @Column
    private String fechafin;

}