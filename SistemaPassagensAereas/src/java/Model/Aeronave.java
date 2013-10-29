/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Aeronave implements Serializable {

    @Id
    @GeneratedValue
    private int id;
    
    private String modeloAeronave;
    private int qtdAssentosEcon;
    private int qtdAssentosPclas;
    
    
    public int getId() {
        return id;
    }


    public void setId(int idValue) {
        id = idValue;
    }

    public String getModeloAeronave() {
        return modeloAeronave;
    }

    public void setModeloAeronave(String modeloAeronave) {
        this.modeloAeronave = modeloAeronave;
    }

    public int getQtdAssentosEcon() {
        return qtdAssentosEcon;
    }

    public void setQtdAssentosEcon(int qtdAssentosEcon) {
        this.qtdAssentosEcon = qtdAssentosEcon;
    }

    public int getQtdAssentosPclas() {
        return qtdAssentosPclas;
    }

    public void setQtdAssentosPclas(int qtdAssentosPclas) {
        this.qtdAssentosPclas = qtdAssentosPclas;
    }
    
}
