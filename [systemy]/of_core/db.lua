local SQL

local function connect()
    -- w ponizszej linii uzupelnij dane autoryzacji
	SQL = dbConnect("mysql", "dbname=db_19515;host=46.29.17.244", "db_19515","PuHyp63gTZ5e6Vk8V5nK4cHQu","share=1")
	if (not SQL) then
		outputServerLog("BRAK POLACZENIA Z BAZA DANYCH!")
	else
		outputDebugString("DB PASS")
		zapytanie("SET NAMES utf8;")
	end

end
addEventHandler("onResourceStart",resourceRoot, connect)

function pobierzTabeleWynikow(...)
	local h=dbQuery(SQL,...)
	if (not h) then 
		return nil
	end
	local rows = dbPoll(h, -1)
	return rows
end

function pobierzWyniki(...)
	local h=dbQuery(SQL,...)
	if (not h) then 
		return nil
	end
	local rows = dbPoll(h, -1)
	if not rows then return nil end
	return rows[1]
end

function zapytanie(...)
	local h=dbQuery(SQL,...)
	local result,numrows, last_id=dbPoll(h,-1)
	return numrows
end

function zapytanieID(...)
	local h=dbQuery(SQL,...)
	local result,numrows, last_id=dbPoll(h,-1)
	return numrows, last_id
end

function update(...)
	local h=dbExec(SQL,...)
	return h
end

