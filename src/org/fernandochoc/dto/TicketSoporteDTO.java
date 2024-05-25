/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fernandochoc.dto;

import org.fernandochoc.model.TicketSoporte;
/**
 *
 * @author Fercho
 */
public class TicketSoporteDTO {
    private static TicketSoporteDTO instance;
    private TicketSoporte ticket;
    
    private TicketSoporteDTO(){
        
    }
    
    public static TicketSoporteDTO getTicketSoporteDTO(){
        if(instance == null){
            instance = new TicketSoporteDTO();
        }
        return instance;
    }

    public TicketSoporte getTicketSoporte() {
        return ticket;
    }

    public void setTicketSoporte(TicketSoporte ticket) {
        this.ticket = ticket;
    }
}