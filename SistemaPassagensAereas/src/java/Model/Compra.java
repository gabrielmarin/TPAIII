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
public class Compra {

    @Id
    @GeneratedValue
    private int id;
    
    @ManyToOne
    private Pessoa pessoa;
    
    
    
    public int getId() {
        return id;
    }

    
    public void setId(int idValue) {
        id = idValue;
    }

    public Pessoa getPessoa() {
        return pessoa;
    }

    public void setPessoa(Pessoa pessoa) {
        this.pessoa = pessoa;
    }
    
}
