trigger PublishingEvent on Contact (after update) {
    
 //   If(trigger.isAfter && trigger.isUpdate){
        List<Contact_Updated__e> publishEvents = new List<Contact_Updated__e>();
        for (Contact c : Trigger.new){
            Contact_Updated__e e = new Contact_Updated__e();
            e.Name__c = c.Name;
            publishEvents.add(e);
        }
        if (publishEvents.size()>0){
            List<Database.SaveResult> results = EventBus.publish(publishEvents);
            for (Database.SaveResult sr : results){
                if(sr.isSuccess()){
                    system.debug('Success');}
                else {
                    for(Database.Error er : sr.getErrors()){
                        system.debug('Error: ' + er.getMessage());
                    }
                }
                }
            }
      //  }
    }


