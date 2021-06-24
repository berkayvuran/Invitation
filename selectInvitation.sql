select 
g.Name + ' ' + g.Surname as Davetli,
c.Name as Ýl,
ci.Description as Ýliþki,
case g.IsBoarding
	when 'True' then 'Evet'
	else 'Hayýr'
END as 'Yatýlý Mý',
ds.Name as 'Kimin Davetlisi',
dm.Name as 'Ulaþtýrma Yöntemi',
case g.IsReady
	when 'True' then 'Evet'
	else 'Hayýr'
END as 'Hazýr Mý',
case g.IsGiven
	when 'True' then 'Evet'
	else 'Hayýr'
END as 'Verildi Mi',
case g.IsInvitedToTheParty
	when 'True' then 'Evet'
	else 'Hayýr'
END as 'Akþama Davetli Mi',
g.GiftQuantity + ' Adet ' + gi.Name + ' ' + gd.Name  as 'Hediye'
from Guests g
join ContactInfos ci on g.ContactInfoId = ci.Id
join Cities c on c.Id = ci.CityId
join DataSources ds on g.DataSourceId = ds.Id
join DeliveryMethods dm on g.DeliveryMethodId = dm.Id
left join GiftInfos gi on g.GiftInfoId = gi.Id
left join GiftDetails gd on gi.GiftDetailId = gd.Id
order by ds.Name, dm.Name, g.Name

select ds.Name as 'Kimin Davetlisi', count (ds.Name) as 'Davetli Sayýsý' from Guests g
join DataSources ds on g.DataSourceId = ds.Id
group by ds.Name

select dm.Name as 'Veriliþ Yöntemi', count (dm.Name) as 'Davetli Sayýsý' from Guests g
join DeliveryMethods dm on g.DeliveryMethodId = dm.Id
group by dm.Name

select
CASE g.IsInvitedToTheParty
WHEN 0 Then 'Hayýr'
ELSE 'Evet'
END as 'Akþama Davetli Mi',
count(*) as 'Davetli Sayýsý' from Guests g
group by g.IsInvitedToTheParty
