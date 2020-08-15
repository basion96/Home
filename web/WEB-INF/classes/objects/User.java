package objects;

import java.util.ArrayList;
import java.util.List;

public class User {

    private String name, accountCreation;
    private List<String> roles;

    public User(){
        this.name = "";
        this.accountCreation = "";
        this.roles = new ArrayList<>();
    }

    public User(String name, List<String> roles, String accountCreation){
        this.name = name;
        this.roles = roles;
        this.accountCreation = accountCreation;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAccountCreation(String accountCreation) {
        this.accountCreation = accountCreation;
    }

    public void addRole(String role) {
        roles.add(role);
    }

    public String getName() {
        return name;
    }

    public String getAccountCreation() {
        return accountCreation;
    }

    public List<String> getRoles() {
        return roles;
    }
}
