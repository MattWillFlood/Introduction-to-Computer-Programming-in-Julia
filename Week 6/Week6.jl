### A Pluto.jl notebook ###
# v0.14.7

using Markdown
using InteractiveUtils

# ╔═╡ d58cad3e-a866-4e0e-8f29-821188861a12
begin 
	using Plots
	plotly()
end

# ╔═╡ 1cd6f911-7cca-4e14-9a0e-0885902df8d1
using DataFrames, StatsBase, Statistics, CSV

# ╔═╡ 311a2e58-f62c-4802-94e8-6a1cadd9482b
using StatsPlots

# ╔═╡ 2b77c301-778a-4e7d-b176-194362ebec5e
begin     
	import DarkMode
    DarkMode.enable()
    # OR DarkMode.Toolbox(theme="default")
end

# ╔═╡ 5e2b475c-b810-44e7-b6fa-7cebc12e14a7
# If we want to import the CSV with a different delimiter, we use the kwarg: delim = ','.
Data = CSV.read("StudyData.csv", DataFrame)

# ╔═╡ a54afdf1-060e-4995-98ae-357c3f936329
#Data = CSV.read(raw"C:\mflood\StudyData.csv", DataFrame)

# ╔═╡ 6f00175d-ab7b-4d2f-b3f9-5c6155f0412e
first(Data,3)

# ╔═╡ c73c47aa-337e-4c8a-b687-7330b10d40a4
last(Data,4) # You can specify the number of rows you want to show with an integer second argument.

# ╔═╡ b8008dda-039e-4123-aad4-1068ed3887ed
names(Data)
# names() tells us the column header names in our DataFrame

# ╔═╡ 83a0d5b3-4acd-44c6-9a1d-7e1512cbcafc
propertynames(Data)
# Note symbol notation

# ╔═╡ e6acf18f-4521-4f7d-ad22-26c3aecc9650
Data.Condition

# ╔═╡ 691e3848-37a7-4e22-9d6b-8db076abdef9
Data.:"Subject ID"

# ╔═╡ dd0019e5-c2b5-49a5-9045-99539374e02c
typeof(Data.:"Hairy Knees?")

# ╔═╡ 665bbf76-1c86-49ee-85c3-3c8f6d419e1d
columnindex(Data,"Itchy Eyebrows?")

# ╔═╡ 046f9230-fe7c-40cb-b202-3683d8cf69e1
unique(Data.Condition)

# ╔═╡ fe8fcd96-f0d6-4d8f-b1a0-73c4cd1769c5
unique(Data.Age)

# ╔═╡ e16ad9c7-322b-4c67-9746-9b077eb593fa
describe(Data,  :mean, cols=:Age)
# Does exactly what it says on the tin - it describes the content of our DataFrame

# ╔═╡ c5058cb7-20cb-45a6-830d-e7103f4c860f
scatter(Data.Age,Data.Weight, xlabel="Age", ylabel="Weight", group=Data.Condition, hover=Data.:"Subject ID")

# ╔═╡ f6fb2271-8d32-4fb5-8e0b-cbde211db6d4
skewness(Data.Age)

# ╔═╡ 84cbf844-5a0c-42b5-a592-5cda92d452c8
mad(Data.ExpectedLifespan)

# ╔═╡ 8fedbbd4-4b76-4202-a2af-000d11286525
WTHS = select(Data, ["Webbed Toes?", "HealthScore"])

# ╔═╡ 62233778-aaf2-43a5-ba79-0dc6df61fae9
select(Data, ["Weight", :HealthScore])
# Note here that the two variables in the second argument are different (a string and a symbol).
# They must be of the same type to work correctly

# ╔═╡ 99e19ffe-4f3f-451f-b70d-b67794ff1790
Data[1:3:111, ["Webbed Toes?", "HealthScore"]]

# ╔═╡ ee44190f-c43a-49e6-94ca-a4fdc942aab8
begin
	Loc1 = columnindex(Data,"Webbed Toes?")
	Loc2 = columnindex(Data,"HealthScore")
end
# columnindex tells us where the column belonging to that name is located

# ╔═╡ 7a5c912d-6247-4d55-bb24-8cc279d82024
Loc1

# ╔═╡ dffc07da-2cb6-4d66-aeb6-a6bdac0fac8a
Data[:,[Loc1,Loc2]]

# ╔═╡ 79b77d1f-0051-4a05-bc28-829df5914298
unique(Data.Group)

# ╔═╡ 5839a26a-ce28-4ba8-a47b-92fa152e1f47
YYY = Data[Data.Group.=="B", [Loc1,Loc2]]

# ╔═╡ 8ccb4838-9335-40a3-85f9-feddd106bb05
SortData = sort(Data,["Weight", "Age"], rev=[true, false])
# Sort sorts smallest to largest by default.
# Use the rev kwarg to sort largest to smallest

# ╔═╡ ffc61afa-4547-4c72-b6f4-92ba1e3f389d
😐 ,😄 ,😢 = 1, 2, 3

# ╔═╡ 5d6110b1-a9fd-4a33-b948-ff4d7635262e
NewData = DataFrame(
	Sex=repeat(['m','f','f','m','f'],30),
	Personality=repeat([😐 ,😄 ,😢],50)
)

# ╔═╡ dc526d28-126d-43fb-bbab-52583a4065cd
nrow(NewData)

# ╔═╡ f09f7a94-6016-4ed0-a28d-5dc61cf469e5
ncol(NewData)

# ╔═╡ 64cb6d33-c332-4225-a58d-860d11567d62
FullData = hcat(SortData, NewData)

# ╔═╡ 1c51ee9d-6539-4d77-92a3-e746159c7940
histogram(Data.ExpectedLifespan, nbins=10)

# ╔═╡ 3a250b90-5b87-4a6a-857d-84ff99dab1d2
@df Data groupedhist(:ExpectedLifespan, group = (:Condition, :HealthScore))

# ╔═╡ 8dfcd3fd-0602-4c5a-8163-167f58679831
first(Data,4)

# ╔═╡ e012e266-f54d-4ad2-811c-4e7446f962e7
@df Data groupedhist(:ExpectedLifespan, group = (Data."Webbed Toes?", Data."Hairy Knees?"))

# ╔═╡ dda41941-4cae-40c3-9959-551e78be3619
@df Data marginalscatter(:Age, :ExpectedLifespan, xlabel="Age", ylabel="EL")

# ╔═╡ 8b1d2f76-a079-44f5-aecc-23a465aa8028
@df Data cornerplot([:Age :Weight :ExpectedLifespan :HealthScore])

# ╔═╡ 9de76f37-7a52-48ef-a04d-e77c79bb3837
names(Data)

# ╔═╡ f7ccdc77-2a1e-4b94-9399-c660423c6936
@df Data violin(:Group, :ExpectedLifespan, linewidth=3)

# ╔═╡ 67132a93-9706-4ce7-a713-b22ef6096ed2
@df Data violin(Data.:"Itchy Eyebrows?", :ExpectedLifespan, side=:right, linewidth=0, label="Itchy Eyebrows?")

# ╔═╡ 50b47535-253a-4d9a-9645-b727ad8a1b53
@df Data violin!(Data.:"Webbed Toes?", :ExpectedLifespan, side=:left,
	linewidth=2,  label = "Webbed Toes?", color=:green)

# ╔═╡ 69b61e91-cb2a-49ff-acb7-5c3e1979b723
begin
	@df Data dotplot!(Data.:"Itchy Eyebrows?",
		:ExpectedLifespan, side=:right, marker=(:red,stroke(0)), label="")
	
	@df Data dotplot!(Data.:"Webbed Toes?", 
		:ExpectedLifespan, side=:left, marker=(:yellow,stroke(0)), label="")
end

# ╔═╡ 97bcc5b6-111e-411c-8f25-b676ef90cc2d
begin
	@df Data violin(string.(Data.:"Itchy Eyebrows?"), 
		:ExpectedLifespan, side=:right, linewidth=0, label="Itchy Eyebrows?")
	
	@df Data violin!(string.(Data.:"Webbed Toes?"),
		:ExpectedLifespan, side=:left, linewidth=0, 
		label = "Webbed Toes?", color=:green)
	
	@df Data dotplot!(string.(Data.:"Itchy Eyebrows?"),
		:ExpectedLifespan, side=:right, marker=(:red,stroke(0)), label="")
	
	@df Data dotplot!(string.(Data.:"Webbed Toes?"), 
		:ExpectedLifespan, side=:left, marker=(:yellow,stroke(0)), label="")
	
	ylabel!("Lifespan Estimate")
end

# ╔═╡ d87b2f4a-f001-415b-bb33-e747f199d014
first(Data,5)

# ╔═╡ 162af3d2-22d9-4371-93c4-f8ad03793fdb
DataGroups = groupby(Data, ["Condition","Hairy Knees?"])
# This function groups data by all possible permutations of unique values in each specified column.
# Here we have 3 conditions (Diabetes / Hayfever / Chickenpox) x 2 Hairy Knees values (True / false) = 6 groups

# ╔═╡ 2d98420e-3c41-49e0-acfa-3f46d17c85bb
keys(DataGroups)
# keys tells you the combination of column variables for each group

# ╔═╡ 5974c2fd-5eb5-4537-ae4c-21175741d782
DataGroups[1]

# ╔═╡ 6d5b13f2-45ba-4099-b0bd-5abd47f21f81
temp = plot();

# ╔═╡ b4a8586c-89aa-4ea1-9e74-e25c205cbec7
for sdf in DataGroups
	 scatter!(sdf.ExpectedLifespan, sdf.Age, sdf.HealthScore,
		label = sdf.Condition[1]*"   "*string(sdf.:"Hairy Knees?"[1]))
end

# ╔═╡ 33dca60f-f6b5-4a79-841e-c7da0c4cfd71
begin
	xlabel!("Expected Lifespan")
	ylabel!("Age")
	#zlabel!("Condition")
end


# ╔═╡ 1fe23e98-bdeb-4f1d-b4e6-688953cf2d5e
#display(temp)

# ╔═╡ 5a54e05d-c9a3-4800-95f5-61e1291853b1
begin
	DemMeans = []
	for sdf in DataGroups
	 push!(DemMeans, mean(sdf.ExpectedLifespan))
	end
	plot(DemMeans)
end

# ╔═╡ Cell order:
# ╠═2b77c301-778a-4e7d-b176-194362ebec5e
# ╠═d58cad3e-a866-4e0e-8f29-821188861a12
# ╠═1cd6f911-7cca-4e14-9a0e-0885902df8d1
# ╠═5e2b475c-b810-44e7-b6fa-7cebc12e14a7
# ╠═a54afdf1-060e-4995-98ae-357c3f936329
# ╠═6f00175d-ab7b-4d2f-b3f9-5c6155f0412e
# ╠═c73c47aa-337e-4c8a-b687-7330b10d40a4
# ╠═b8008dda-039e-4123-aad4-1068ed3887ed
# ╠═83a0d5b3-4acd-44c6-9a1d-7e1512cbcafc
# ╠═e6acf18f-4521-4f7d-ad22-26c3aecc9650
# ╠═691e3848-37a7-4e22-9d6b-8db076abdef9
# ╠═dd0019e5-c2b5-49a5-9045-99539374e02c
# ╠═665bbf76-1c86-49ee-85c3-3c8f6d419e1d
# ╠═046f9230-fe7c-40cb-b202-3683d8cf69e1
# ╠═fe8fcd96-f0d6-4d8f-b1a0-73c4cd1769c5
# ╠═e16ad9c7-322b-4c67-9746-9b077eb593fa
# ╠═c5058cb7-20cb-45a6-830d-e7103f4c860f
# ╠═f6fb2271-8d32-4fb5-8e0b-cbde211db6d4
# ╠═84cbf844-5a0c-42b5-a592-5cda92d452c8
# ╠═8fedbbd4-4b76-4202-a2af-000d11286525
# ╠═62233778-aaf2-43a5-ba79-0dc6df61fae9
# ╠═99e19ffe-4f3f-451f-b70d-b67794ff1790
# ╠═ee44190f-c43a-49e6-94ca-a4fdc942aab8
# ╠═7a5c912d-6247-4d55-bb24-8cc279d82024
# ╠═dffc07da-2cb6-4d66-aeb6-a6bdac0fac8a
# ╠═79b77d1f-0051-4a05-bc28-829df5914298
# ╠═5839a26a-ce28-4ba8-a47b-92fa152e1f47
# ╠═8ccb4838-9335-40a3-85f9-feddd106bb05
# ╠═ffc61afa-4547-4c72-b6f4-92ba1e3f389d
# ╠═5d6110b1-a9fd-4a33-b948-ff4d7635262e
# ╠═dc526d28-126d-43fb-bbab-52583a4065cd
# ╠═f09f7a94-6016-4ed0-a28d-5dc61cf469e5
# ╠═64cb6d33-c332-4225-a58d-860d11567d62
# ╠═1c51ee9d-6539-4d77-92a3-e746159c7940
# ╠═311a2e58-f62c-4802-94e8-6a1cadd9482b
# ╠═3a250b90-5b87-4a6a-857d-84ff99dab1d2
# ╠═8dfcd3fd-0602-4c5a-8163-167f58679831
# ╠═e012e266-f54d-4ad2-811c-4e7446f962e7
# ╠═dda41941-4cae-40c3-9959-551e78be3619
# ╠═8b1d2f76-a079-44f5-aecc-23a465aa8028
# ╠═9de76f37-7a52-48ef-a04d-e77c79bb3837
# ╠═f7ccdc77-2a1e-4b94-9399-c660423c6936
# ╠═67132a93-9706-4ce7-a713-b22ef6096ed2
# ╠═50b47535-253a-4d9a-9645-b727ad8a1b53
# ╠═69b61e91-cb2a-49ff-acb7-5c3e1979b723
# ╠═97bcc5b6-111e-411c-8f25-b676ef90cc2d
# ╠═d87b2f4a-f001-415b-bb33-e747f199d014
# ╠═162af3d2-22d9-4371-93c4-f8ad03793fdb
# ╠═2d98420e-3c41-49e0-acfa-3f46d17c85bb
# ╠═5974c2fd-5eb5-4537-ae4c-21175741d782
# ╠═6d5b13f2-45ba-4099-b0bd-5abd47f21f81
# ╠═b4a8586c-89aa-4ea1-9e74-e25c205cbec7
# ╠═33dca60f-f6b5-4a79-841e-c7da0c4cfd71
# ╠═1fe23e98-bdeb-4f1d-b4e6-688953cf2d5e
# ╠═5a54e05d-c9a3-4800-95f5-61e1291853b1
