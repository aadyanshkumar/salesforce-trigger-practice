Opportunity opp = new Opportunity(
    Name = 'Amazon Deal',
    StageName = 'Prospecting',
    CloseDate = Date.today()
);

insert opp;

opp.StageName = 'Closed Won';

update opp;