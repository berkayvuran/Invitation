select 
g.Name + ' ' + g.Surname as Davetli,
c.Name as �l,
case g.IsBoarding
	when 'True' then 'Evet'
	else 'Hay�r'
END as 'Yat�l� M�',
ds.Name as 'Kimin Davetlisi',
dm.Name as 'Ula�t�rma Y�ntemi',
case g.IsReady
	when 'True' then 'Evet'
	else 'Hay�r'
END as 'Haz�r M�',
case g.IsGiven
	when 'True' then 'Evet'
	else 'Hay�r'
END as 'Verildi Mi',
case g.IsInvitedToTheParty
	when 'True' then 'Evet'
	else 'Hay�r'
END as 'Ak�ama Davetli Mi'
from Guests g
join ContactInfos ci on g.ContactInfoId = ci.Id
join Cities c on c.Id = ci.CityId
join DataSources ds on g.DataSourceId = ds.Id
join DeliveryMethods dm on g.DeliveryMethodId = dm.Id
where g.DataSourceId=1 and
g.IsReady = 1 and
g.IsGiven = 1
order by ds.Name, dm.Name, g.Name

