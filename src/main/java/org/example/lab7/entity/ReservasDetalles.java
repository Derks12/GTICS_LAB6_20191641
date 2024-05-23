package org.example.lab7.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
@Embeddable
public class ReservasDetalles implements Serializable {

    @Column(name="dispositivos_iddispositivos")
    private Integer iddispositivos;
    @Column(name = "usuario_idUsuario")
    private Integer idUsuario;


}
