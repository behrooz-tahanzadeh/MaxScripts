--Developed by Behrooz Tahanzadeh
--website:b-tz.com
--oct 2014

rollout assignMatRl "Assign Material Randomly" width:200 height:300
(
	label guide1 "Enter comma separated index of target materials..." pos:[10,10] width:150 height:40
	editText matIndexTb pos:[10,50] width:150 height:25
	button assignBtn "Assign" pos:[10,85] width:50 height:20
	
	
	on assignBtn pressed do
	(
		undo on
		(
			str = matIndexTb.text;
			indexes = #();
			
			for w in (filterString str ",") do
			(
				append indexes (w as Integer);
			)
			
			for x in selection do
			(
				i = indexes[random 1 indexes.count];
				x.material = meditMaterials[i];
			)
		)
	)
)--end of assignMatRl


rollout aboutRl "About" width:200 height:300
(
	label desc "developed by\nBehrooz Tahanzadeh\n\nwebsite:b-tz.com\noct 2014" pos:[10,10] width:180 height:70
)--end of AboutRl

floater = newRolloutFloater "Randomizer!" 200 300

addRollout assignMatRl floater
addRollout aboutRl floater