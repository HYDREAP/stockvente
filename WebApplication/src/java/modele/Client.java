
package modele;
// Generated 22 mai 2013 13:31:13 by Hibernate Tools 3.4.0.CR1


import org.hibernate.annotations.Entity;
import org.hibernate.annotations.Table;
import org.hibernate.mapping.Column;

/**
 * Client generated by hbm2java
 */
@Entity
@Table( name = "client" )
public class Client implements java.io.Serializable {

    private int    idClient;
    private String nomClient;
    private String prenomClient;
    private String adresseClient;
    private Long   cpClient;
    private String villeClient;
    private String telClient;
    private String emailClient;

    public Client() {
    }

    public Client( int idClient ) {
        this.idClient = idClient;
    }

    public Client( int idClient, String nomClient, String prenomClient, String adresseClient, Long cpClient,
            String villeClient, String telClient, String emailClient ) {
        this.idClient = idClient;
        this.nomClient = nomClient;
        this.prenomClient = prenomClient;
        this.adresseClient = adresseClient;
        this.cpClient = cpClient;
        this.villeClient = villeClient;
        this.telClient = telClient;
        this.emailClient = emailClient;
    }

    @Id
    @Column( name = "id_client", unique = true, nullable = false )
    public int getIdClient() {
        return this.idClient;
    }

    public void setIdClient( int idClient ) {
        this.idClient = idClient;
    }

    @Column( name = "nom_client", length = 128 )
    public String getNomClient() {
        return this.nomClient;
    }

    public void setNomClient( String nomClient ) {
        this.nomClient = nomClient;
    }

    @Column( name = "prenom_client", length = 128 )
    public String getPrenomClient() {
        return this.prenomClient;
    }

    public void setPrenomClient( String prenomClient ) {
        this.prenomClient = prenomClient;
    }

    @Column( name = "adresse_client", length = 128 )
    public String getAdresseClient() {
        return this.adresseClient;
    }

    public void setAdresseClient( String adresseClient ) {
        this.adresseClient = adresseClient;
    }

    @Column( name = "cp_client" )
    public Long getCpClient() {
        return this.cpClient;
    }

    public void setCpClient( Long cpClient ) {
        this.cpClient = cpClient;
    }

    @Column( name = "ville_client", length = 128 )
    public String getVilleClient() {
        return this.villeClient;
    }

    public void setVilleClient( String villeClient ) {
        this.villeClient = villeClient;
    }

    @Column( name = "tel_client", length = 128 )
    public String getTelClient() {
        return this.telClient;
    }

    public void setTelClient( String telClient ) {
        this.telClient = telClient;
    }

    @Column( name = "email_client", length = 128 )
    public String getEmailClient() {
        return this.emailClient;
    }

    public void setEmailClient( String emailClient ) {
        this.emailClient = emailClient;
    }

}
