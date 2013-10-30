/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Voo{

    @Id
    @GeneratedValue
    private int id;
    private int assentosEconDisponiveis;
    private int assentosPClasDisponiveis;
    private int numVoo;
    private int duracao;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date partida;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date chegada;
    
    @ManyToOne
    private Trecho trecho;
    
    @ManyToOne
    private Aeronave aeronave;
    
    
    public int getId() {
        return id;
    }

    
    public void setId(int idValue) {
        id = idValue;
    }

    public int getAssentosEconDisponiveis() {
        return assentosEconDisponiveis;
    }

    public void setAssentosEconDisponiveis(int assentosEconDisponiveis) {
        this.assentosEconDisponiveis = assentosEconDisponiveis;
    }

    public int getAssentosPClasDisponiveis() {
        return assentosPClasDisponiveis;
    }

    public void setAssentosPClasDisponiveis(int assentosPClasDisponiveis) {
        this.assentosPClasDisponiveis = assentosPClasDisponiveis;
    }

    public int getNumVoo() {
        return numVoo;
    }

    public void setNumVoo(int numVoo) {
        this.numVoo = numVoo;
    }

    public int getDuracao() {
        return duracao;
    }

    public void setDuracao(int duracao) {
        this.duracao = duracao;
    }

    public Date getPartida() {
        return partida;
    }

    public void setPartida(Date partida) {
        this.partida = partida;
    }

    public Date getChegada() {
        return chegada;
    }

    public void setChegada(Date chegada) {
        this.chegada = chegada;
    }

    public Trecho getTrecho() {
        return trecho;
    }

    public void setTrecho(Trecho trecho) {
        this.trecho = trecho;
    }

    public Aeronave getAeronave() {
        return aeronave;
    }

    public void setAeronave(Aeronave aeronave) {
        this.aeronave = aeronave;
    }
    
}
