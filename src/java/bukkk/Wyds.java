/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bukkk;

import java.util.ArrayList;

/**
 *
 * @author MatekTSW
 */
public class Wyds {
    
    private ArrayList<Wyd> wydList;
    
     public Wyds()
    {
        wydList = new ArrayList<Wyd>();        
    }
    
       public Wyd get(int index)
    {
        return wydList.get(index);
    }
    
    public void add(Wyd w)
    {
        wydList.add(w);
    }
    
    public int size()
    {
        return wydList.size();
    }
}
