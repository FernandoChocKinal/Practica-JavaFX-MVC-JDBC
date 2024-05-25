/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fernandochoc.dto;

import org.fernandochoc.model.DetalleCompra;
/**
 *
 * @author Fercho
 */
public class DetalleCompraDTO {
    private static DetalleCompraDTO instance;
    private DetalleCompra detCompra;
    
    private DetalleCompraDTO(){
        
    }
    
    public static DetalleCompraDTO getDetalleCompraDTO(){
        if(instance == null){
            instance = new DetalleCompraDTO();
        }
        return instance;
    }

    public DetalleCompra getDetalleCompra() {
        return detCompra;
    }

    public void setDetalleCompra(DetalleCompra detCompra) {
        this.detCompra = detCompra;
    }
}