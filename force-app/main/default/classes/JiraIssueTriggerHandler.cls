public with sharing class JiraIssueTriggerHandler {
    
    public void run () {

        switch on Trigger.operationType {
            
            when BEFORE_INSERT {
                System.debug('before insert issue');
            }
            when AFTER_INSERT {
                System.debug('after insert issue');
            }
            when BEFORE_UPDATE {
                System.debug('before update issue');
            }
            when AFTER_UPDATE {
                System.debug('after update issue');
            }
            when BEFORE_DELETE {
                System.debug('before delete issue');
            }
            when AFTER_DELETE {
                System.debug('after delete issue');
            }
            when AFTER_UNDELETE {
                System.debug('after undelete issue');
            }
        }
    }
}