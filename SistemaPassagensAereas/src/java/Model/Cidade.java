package Model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Cidade{

    @Id
    @GeneratedValue
    private int id;
    
    
    private String nomeCidade;
    private String uf;
    
    
    public int getId() {
        return id;
    }

    
    public void setId(int idValue) {
        id = idValue;
    }
    /**
     * @return the nomeCidade
     */
    public String getNomeCidade() {
        return nomeCidade;
    }

    /**
     * @param nomeCidade the nomeCidade to set
     */
    public void setNomeCidade(String nomeCidade) {
        this.nomeCidade = nomeCidade;
    }

    /**
     * @return the uf
     */
    public String getUf() {
        return uf;
    }

    /**
     * @param uf the uf to set
     */
    public void setUf(String uf) {
        this.uf = uf;
    }

    
    
}
