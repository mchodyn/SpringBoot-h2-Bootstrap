package com.example.jaz3.service;


import com.example.jaz3.model.Owner;
import com.example.jaz3.repo.OwnerRepository;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
@Service
@Transactional
public class OwnerService {

    private final OwnerRepository ownerRepository;

    public OwnerService(OwnerRepository ownerRepository) {
        this.ownerRepository=ownerRepository;
    }

    public List<Owner> findAll() {
        List<Owner> owners = ownerRepository.findAll();
        return owners;
    }

    public Owner findOwner(Long id) {
        List<Owner> owners = ownerRepository.findAll();
        Owner owner = new Owner();
        for (Owner o:owners) {
            if(o.getId()==id) {
                owner=o;
            }

        }
        return owner ;
    }
    public void save(Owner owner) {
        ownerRepository.save(owner);
    }
    public void delete(Long id) {
        ownerRepository.deleteById(id);
    }
}
