public with sharing class TaskUtils {
public static void remindOwners(List<Opportunity> oppList) {

    List<Task> taskList = new List<Task>();
    For(Opportunity opp : oppList) {
      Task newTask = new Task(
           WhatId = opp.Id,
           OwnerId = opp.OwnerId,
           ActivityDate = Date.today(),
          Subject = 'Update Opportunity',
           Description = 'Kindly close the ticket by the end of the day');
        taskList.add(newTask);
        }
        insert taskList;
    }
}