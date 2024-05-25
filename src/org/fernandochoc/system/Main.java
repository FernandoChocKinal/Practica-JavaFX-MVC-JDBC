/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fernandochoc.system;

import java.io.InputStream;
import javafx.application.Application;
import static javafx.application.Application.launch;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.fxml.JavaFXBuilderFactory;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import org.fernandochoc.controller.FormCargoController;
import org.fernandochoc.controller.FormCategoriaProductoController;
import org.fernandochoc.controller.FormClienteController;
import org.fernandochoc.controller.FormCompraController;
import org.fernandochoc.controller.FormDistribuidorController;
import org.fernandochoc.controller.MenuCargoController;
import org.fernandochoc.controller.MenuCategoriaProductoController;
import org.fernandochoc.controller.MenuClienteController;
import org.fernandochoc.controller.MenuCompraController;
import org.fernandochoc.controller.MenuDetalleCompraController;
import org.fernandochoc.controller.MenuDetalleFacturaController;
import org.fernandochoc.controller.MenuPrincipalController;
import org.fernandochoc.controller.MenuTicketSoporteController;
import org.fernandochoc.controller.MenuDistribuidorController;
import org.fernandochoc.controller.MenuEmpleadoController;
import org.fernandochoc.controller.MenuFacturaController;
import org.fernandochoc.controller.MenuProductoController;
import org.fernandochoc.controller.MenuPromocionController;

/**
 *
 * @author Fercho
 */
public class Main extends Application {
    
    private Stage stage;
    private Scene scene;
    private final String URLVIEW = "/org/ianalfaro/view/";
    
    @Override
    public void start(Stage stage) throws Exception {
        
        this.stage = stage;
        stage.setTitle("Super Kinal App");
        menuPrincipalView();
        stage.show();
    }
    
    public Initializable switchScene(String fxmlName, int width, int height) throws Exception{
        Initializable resultado;
        FXMLLoader loader = new FXMLLoader();
        
        InputStream file = Main.class.getResourceAsStream(URLVIEW + fxmlName);
        loader.setBuilderFactory(new JavaFXBuilderFactory());
        loader.setLocation(Main.class.getResource(URLVIEW + fxmlName));
        
        scene = new Scene((AnchorPane) loader.load(file), width, height);
        stage.setScene(scene);
        stage.sizeToScene();
             
        resultado = (Initializable)loader.getController();
        
        return resultado;
    }
    
    public void menuPrincipalView(){
        try{
            MenuPrincipalController menuPrincipalView = (MenuPrincipalController)switchScene("MenuPrincipalView.fxml", 950, 775);
            menuPrincipalView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void menuClienteView(){
         try{
            MenuClienteController menuClienteView = (MenuClienteController)switchScene("MenuClientesView.fxml", 1200, 850);
            menuClienteView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void menuCargosView(){
         try{
            MenuCargoController menuCargoView = (MenuCargoController)switchScene("MenuCargosView.fxml", 1200, 850);
            menuCargoView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void menuDistribuidorView(){
         try{
            MenuDistribuidorController menuDistribuidoresView = (MenuDistribuidorController)switchScene("MenuDistribuidorView.fxml", 1200, 850);
            menuDistribuidoresView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void menuCategoriaProductoView(){
         try{
            MenuCategoriaProductoController menuCategoriaProductosView = (MenuCategoriaProductoController)switchScene("MenuCategoriaProductosView.fxml", 1200, 850);
            menuCategoriaProductosView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void menuComprasView(){
         try{
            MenuCompraController menuCompraView = (MenuCompraController)switchScene("MenuComprasView.fxml", 1200, 850);
            menuCompraView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void menuTicketSoporteView(){
         try{
            MenuTicketSoporteController menuTicketSoporteView = (MenuTicketSoporteController)switchScene("MenuTicketSoportesView.fxml", 1200, 850);
            menuTicketSoporteView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void menuEmpleadoView(){
         try{
            MenuEmpleadoController menuEmpleadoView = (MenuEmpleadoController)switchScene("MenuEmpleadosView.fxml", 1200, 850);
            menuEmpleadoView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void menuFacturaView(){
         try{
            MenuFacturaController menuFacturaView = (MenuFacturaController)switchScene("MenuFacturasView.fxml", 1200, 850);
            menuFacturaView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void menuPromocionView(){
         try{
            MenuPromocionController menuPromocionView = (MenuPromocionController)switchScene("MenuPromocionesView.fxml", 1200, 850);
            menuPromocionView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void menuProductoView(){
         try{
            MenuProductoController menuProductoView = (MenuProductoController)switchScene("MenuProductosView.fxml", 1500, 950);
            menuProductoView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    
    public void menuDetalleCompraView(){
         try{
            MenuDetalleCompraController menuDetalleCompraView = (MenuDetalleCompraController)switchScene("MenuDetalleComprasView.fxml", 1200, 850);
            menuDetalleCompraView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void menuDetalleFacturaView(){
         try{
            MenuDetalleFacturaController menuDetalleFacturaView = (MenuDetalleFacturaController)switchScene("MenuDetalleFacturasView.fxml", 1200, 850);
            menuDetalleFacturaView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void formClienteView(int op){
         try{
            FormClienteController formClienteView = (FormClienteController)switchScene("FormClienteView.fxml", 500, 750);
            formClienteView.setOp(op);
            formClienteView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void formCargoView(int op){
         try{
            FormCargoController formCargoView = (FormCargoController)switchScene("FormCargoView.fxml", 500, 750);
            formCargoView.setOp(op);
            formCargoView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void formDistribuidorView(int op){
         try{
            FormDistribuidorController formDistribuidorView = (FormDistribuidorController)switchScene("FormDistribuidorView.fxml", 500, 750);
            formDistribuidorView.setOp(op);
            formDistribuidorView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void formCategoriaProductoView(int op){
         try{
            FormCategoriaProductoController formCategoriaProductoView = (FormCategoriaProductoController)switchScene("FormCategoriaProductoView.fxml", 500, 750);
            formCategoriaProductoView.setOp(op);
            formCategoriaProductoView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void formCompraView(int op){
         try{
            FormCompraController formCompraView = (FormCompraController)switchScene("FormCompraView.fxml", 500, 750);
            formCompraView.setOp(op);
            formCompraView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        launch(args);
    }   
}