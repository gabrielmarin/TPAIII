/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;


@Entity
public class Aeroporto {

    
    @Id
    @GeneratedValue
    private int id;
    
    private String nomeAeroporto;
    private String sigla;
    
    @ManyToOne
    private Cidade cidade;
    
    
    public int getId() {
        return id;       
    }

    
    public void setId(int idValue) {
       id = idValue;
    }

    public String getNomeAeroporto() {
        return nomeAeroporto;
    }

    public void setNomeAeroporto(String nomeAeroporto) {
        this.nomeAeroporto = nomeAeroporto;
    }

    public String getSigla() {
        return sigla;
    }

    public void setSigla(String sigla) {
        this.sigla = sigla;
    }

    public Cidade getCidade() {
        return cidade;
    }

    public void setCidade(Cidade cidade) {
        this.cidade = cidade;
    }
    
}
