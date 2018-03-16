#!/bin/ruby

configsArray = ["NewsMaster/XCConfigs/NewsMasterInHouse.xcconfig"]

lineArr = IO.readlines("NewsMaster/Base.xcconfig")
versionLine = ""
for line in lineArr
	if line.strip.index("NM_APP_VERSION_GENERAL")
		versionLine = line.strip.delete("NM_APP_VERSION_GENERAL =").strip
		break
	end
end
subVStr = versionLine.split(".")
if subVStr.length != 3
	puts "error!"
	exit 1
else
	v0 = subVStr[0].to_i + 1
	v1 = subVStr[1].to_i + 6
	v2 = subVStr[2].to_i
	version = v0.to_s + "." + v1.to_s + "." + v2.to_s

	configsArray.each { |path|
		lineIndex  = 0
		newFileArr = IO.readlines("NewsMaster/XCConfigs/NewsMasterInHouse.xcconfig")
		for newFileLine in newFileArr
			if newFileLine.strip.index("NM_APP_VERSION")
				break
			end
			lineIndex = lineIndex + 1
		end

		File.delete("NewsMaster/XCConfigs/NewsMasterInHouse.xcconfig")

		aFile = File.new("NewsMaster/XCConfigs/NewsMasterInHouse.xcconfig", "a+")
		newFileArr[lineIndex] = "NM_APP_VERSION = " + version + "\n"
		newFileArr.each { |subline|
			aFile.syswrite(subline)
		}
	}
	exit 0
end

# ruby ./checkout_version_number.rb > /dev/null
# if [ $? != 0 ] ; then
#     # print error to STDERR
#     echo "version error." >&2
#     exit 1
# fi
