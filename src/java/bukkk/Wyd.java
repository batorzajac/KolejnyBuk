/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bukkk;

/**
 *
 * @author MatekTSW
 */
public class Wyd {
    
    private String dyscyplina;
    private String wydarzenie;
    private String data;
    private String rozgrywki;
    private int id;
    
    public Wyd(String wyd,String dys,String data,String rozg, int id)
    {
        this.dyscyplina = dys;
        this.wydarzenie = wyd;
        this.data = data;
        this.rozgrywki = rozg;
        this.id=id;
    }
   

    public String getWydarzenie() {
        return wydarzenie;
    }
    
    public String getDyscyplina() {
        return dyscyplina;
    }
    public String getRozgrywki() {
        return rozgrywki;
    }
    public String getData() {
        return data;
    }
    public int getId() {
        return id;
    }
}
