/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fernandochoc.dto;

import org.fernandochoc.model.CategoriaProducto;
/**
 *
 * @author Fercho
 */
public class CategoriaProductoDTO {
    private static CategoriaProductoDTO instance;
    private CategoriaProducto categoria;
    
    private CategoriaProductoDTO(){
        
    }
    
    public static CategoriaProductoDTO getCategoriaProductoDTO(){
        if(instance == null){
            instance = new CategoriaProductoDTO();
        }
        return instance;
    }

    public CategoriaProducto getCategoriaProducto() {
        return categoria;
    }

    public void setCategoriaProducto(CategoriaProducto categoria) {
        this.categoria = categoria;
    }
}