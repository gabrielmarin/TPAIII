/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Trecho implements Serializable{

    @Id
    @GeneratedValue
    private int id;
    
    @Column(nullable=false)
    private int idCidadeOrigem;
    
    @Column(nullable=false)
    private int idCidadeDestino;
    
    @Column(nullable=false)
    private int distancia; 
    
    
    
    public int getId() {
       return id;
    }

    
    public void setId(int idValue) {
       id = idValue;               
    }

    public int getIdCidadeOrigem() {
        return idCidadeOrigem;
    }

    public void setIdCidadeOrigem(int idCidadeOrigem) {
        this.idCidadeOrigem = idCidadeOrigem;
    }

    public int getIdCidadeDestino() {
        return idCidadeDestino;
    }

    public void setIdCidadeDestino(int idCidadeDestino) {
        this.idCidadeDestino = idCidadeDestino;
    }

    public int getDistancia() {
        return distancia;
    }

    public void setDistancia(int distancia) {
        this.distancia = distancia;
    }
    
}
