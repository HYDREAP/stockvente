package modele;

// Generated 25 mai 2013 15:25:21 by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Produit generated by hbm2java
 */
@Entity
@Table( name = "produit" )
public class Produit implements java.io.Serializable {

    private int               idProduit;
    private String            nomProduit;
    private String            garantieProduit;
    private Set<Prixproduit>  prixproduits  = new HashSet<Prixproduit>( 0 );
    private Set<Stockproduit> stockproduits = new HashSet<Stockproduit>( 0 );
    private Set<Contient>     contients     = new HashSet<Contient>( 0 );

    public Produit() {
    }

    public Produit( int idProduit ) {
        this.idProduit = idProduit;
    }

    public Produit( int idProduit, String nomProduit, String garantieProduit, Set<Prixproduit> prixproduits,
            Set<Stockproduit> stockproduits, Set<Contient> contients ) {
        this.idProduit = idProduit;
        this.nomProduit = nomProduit;
        this.garantieProduit = garantieProduit;
        this.prixproduits = prixproduits;
        this.stockproduits = stockproduits;
        this.contients = contients;
    }

    @Id
    @Column( name = "id_produit", unique = true, nullable = false )
    public int getIdProduit() {
        return this.idProduit;
    }

    public void setIdProduit( int idProduit ) {
        this.idProduit = idProduit;
    }

    @Column( name = "nom_produit", length = 128 )
    public String getNomProduit() {
        return this.nomProduit;
    }

    public void setNomProduit( String nomProduit ) {
        this.nomProduit = nomProduit;
    }

    @Column( name = "garantie_produit", length = 32 )
    public String getGarantieProduit() {
        return this.garantieProduit;
    }

    public void setGarantieProduit( String garantieProduit ) {
        this.garantieProduit = garantieProduit;
    }

    @OneToMany( fetch = FetchType.LAZY, mappedBy = "produit" )
    public Set<Prixproduit> getPrixproduits() {
        return this.prixproduits;
    }

    public void setPrixproduits( Set<Prixproduit> prixproduits ) {
        this.prixproduits = prixproduits;
    }

    @OneToMany( fetch = FetchType.LAZY, mappedBy = "produit" )
    public Set<Stockproduit> getStockproduits() {
        return this.stockproduits;
    }

    public void setStockproduits( Set<Stockproduit> stockproduits ) {
        this.stockproduits = stockproduits;
    }

    @OneToMany( fetch = FetchType.LAZY, mappedBy = "produit" )
    public Set<Contient> getContients() {
        return this.contients;
    }

    public void setContients( Set<Contient> contients ) {
        this.contients = contients;
    }

}
