--Developed by Behrooz Tahanzadeh
--website:b-tz.com
--oct 2014

rollout materialRl "Material" width:200 height:300
(
	label guide1 "Enter comma separated index of target materials... (eg. 1,3,11)" pos:[10,10] width:150 height:40
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
)--end of materialRl




rollout transformRl "Transform" width:200 height:300
(
	spinner minSp "Min: " range:[-9999,9999,-10] pos:[10,10] height:25 width:100 enabled:true scale:0.1
	spinner maxSp "Max: " range:[-9999,9999,10] pos:[10,32] height:25 width:100 enabled:true scale:0.1
	------------------>
	checkbutton xBtn "X" pos:[10,60] width:20 checked:true highlightColor:blue
	checkbutton yBtn "Y" pos:[30,60] width:20 checked:true highlightColor:blue
	checkbutton zBtn "Z" pos:[50,60] width:20 checked:true highlightColor:blue
	checkbutton uniformBtn "Uniform" pos:[80,60] width:50 checked:false highlightColor:blue
	------------------>
	radiobuttons originRb "Origin: " labels:#("relative", "absolute") pos:[10,90] width:50
	------------------>
	button rotateBtn "Rotate" pos:[10,140] width:50 height:20
	button moveBtn "Move" pos:[65,140] width:50 height:20
	button scaleBtn "Scale" pos:[120,140] width:50 height:20
	
	
	
	
	on uniformBtn changed state do
	(
		if (state == on) then
			xBtn.highlightColor = yBtn.highlightColor = zBtn.highlightColor  = gray;
		else
			xBtn.highlightColor = yBtn.highlightColor = zBtn.highlightColor  = blue;
		
		xBtn.caption = "";
		yBtn.caption = "";
		zBtn.caption = "";
		
		xBtn.caption = "X";
		yBtn.caption = "Y";
		zBtn.caption = "Z";
	);--eof
	
	
	
	
	on moveBtn pressed do
	(
		undo on
		(
		for x in selection do
		(
			arr= [0,0,0];
		
			if uniformBtn.state then
			(
				rn = random minSp.value maxSp.value;
				
				if(xBtn.state)then
					arr[1] = rn
				
				if(yBtn.state)then
					arr[2] = rn
				
				if(zBtn.state)then
					arr[3] = rn
			)--end of if
			else
			(
				if(xBtn.state)then
					arr[1] = random minSp.value maxSp.value
				
				if(yBtn.state)then
					arr[2] = random minSp.value maxSp.value
				
				if(zBtn.state)then
					arr[3] = random minSp.value maxSp.value
			)
		
			if originRb.state == 2 then
					x.position = arr;
			else
					move x arr;
		)--eo for
		)--eo undo on
	);-- eof
	
	
	
	on rotateBtn pressed do
	(
		undo on
		(
		for x in selection do
		(
			arr= [0,0,0];
		
			if uniformBtn.state then
			(
				rn = random minSp.value maxSp.value;
				
				if(xBtn.state)then
					arr[1] = rn
				
				if(yBtn.state)then
					arr[2] = rn
				
				if(zBtn.state)then
					arr[3] = rn
			)--end of if
			else
			(
				if(xBtn.state)then
					arr[1] = random minSp.value maxSp.value
				
				if(yBtn.state)then
					arr[2] = random minSp.value maxSp.value
				
				if(zBtn.state)then
					arr[3] = random minSp.value maxSp.value
			)
		
			if originRb.state == 2 then
					x.rotation = (eulerangles arr[1] arr[2] arr[3])
			else
					rotate x (eulerangles arr[1] arr[2] arr[3])
		)--eo for
		)--eo undo on
	);-- eof
	
	
	
	
	on scaleBtn pressed do
	(
		undo on
		(
		for x in selection do
		(
			arr= [0,0,0];
		
			if uniformBtn.state then
			(
				rn = random minSp.value maxSp.value;
				
				if(xBtn.state)then
					arr[1] = rn
				
				if(yBtn.state)then
					arr[2] = rn
				
				if(zBtn.state)then
					arr[3] = rn
			)--end of if
			else
			(
				if(xBtn.state)then
					arr[1] = random minSp.value maxSp.value
				
				if(yBtn.state)then
					arr[2] = random minSp.value maxSp.value
				
				if(zBtn.state)then
					arr[3] = random minSp.value maxSp.value
			)
		
			if originRb.state == 2 then
					x.scale = arr
			else
					scale x arr
		)--eo for
		)--eo undo on
	);-- eof
	
	
	
	
)--end of transformRl




rollout aboutRl "About" width:200 height:300
(	
	label myName  "Developed by Behrooz Tahanzadeh" 
	hyperlink myWebsite "b-tz.com" align:#center address:"http://b-tz.com" color:gray hoverColor:yellow
	
	label NxName  "at NextOffice architecture studio" 
	hyperlink NxWebsite "nextoffice.ir" align:#center address:"http://nextoffice.ir" color:gray hoverColor:yellow
	label data "October 2014"
)--end of AboutRl




floater = newRolloutFloater "Randomizer!" 200 470

addRollout transformRl floater
addRollout materialRl floater
addRollout aboutRl floater

