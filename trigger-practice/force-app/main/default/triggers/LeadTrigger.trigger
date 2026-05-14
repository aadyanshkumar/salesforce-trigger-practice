trigger LeadTrigger on Lead (before insert) {
    Set<String> emailSet = new Set<String>();

    for(Lead lead: Trigger.NEW){
        if(Lead.Email != null){
            if(emailSet.contains(lead.Email)){
                //here found the duplicate email, add error to the record
                Lead.email.addError('Duplicate emails are not allowed here bitch: ');
            }
            emailSet.add(lead.Email);
        }
    }
}