import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module HY_AM {
	public let locale : Types.Locale = {
		id = "hy-am";
		weekdays = [
			"կիրակի",
			"երկուշաբթի",
			"երեքշաբթի",
			"չորեքշաբթի",
			"հինգշաբթի",
			"ուրբաթ",
			"շաբաթ",
		];
		weekdaysShort = [
			"կրկ",
			"երկ",
			"երք",
			"չրք",
			"հնգ",
			"ուրբ",
			"շբթ",
		];
		weekdaysMin = [
			"կրկ",
			"երկ",
			"երք",
			"չրք",
			"հնգ",
			"ուրբ",
			"շբթ",
		];
		months = [
			"հունվար",
			"փետրվար",
			"մարտ",
			"ապրիլ",
			"մայիս",
			"հունիս",
			"հուլիս",
			"օգոստոս",
			"սեպտեմբեր",
			"հոկտեմբեր",
			"նոյեմբեր",
			"դեկտեմբեր",
		];
		monthsShort = [
			"հնվ",
			"փտր",
			"մրտ",
			"ապր",
			"մյս",
			"հնս",
			"հլս",
			"օգս",
			"սպտ",
			"հկտ",
			"նմբ",
			"դկտ",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 7;
		timeFormat = "HH:mm";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "HH:mm DD.MM.YYYY";
		longDateFormat = "DD.MM.YYYY";
		eras = [
			{
				start = ?-62135568422000000;
				end = null;
				offset = 1;
				fullName = "Anno Domini";
				narrowName = "AD";
				abbreviatedName = "AD";
			},
			{
				start = null;
				end = ?-62135654822000000;
				offset = 1;
				fullName = "Before Christ";
				narrowName = "BC";
				abbreviatedName = "BC";
			},
		];
		getMeridiem = func (hour : Nat, minute : Nat, isLower : Bool) : Text {
			let (lower, upper) : (Text, Text) = switch ((hour, minute)) {
				case ((0, _)) ("գիշերվա", "գիշերվա");
				case ((1, _)) ("գիշերվա", "գիշերվա");
				case ((2, _)) ("գիշերվա", "գիշերվա");
				case ((3, _)) ("գիշերվա", "գիշերվա");
				case ((4, _)) ("առավոտվա", "առավոտվա");
				case ((5, _)) ("առավոտվա", "առավոտվա");
				case ((6, _)) ("առավոտվա", "առավոտվա");
				case ((7, _)) ("առավոտվա", "առավոտվա");
				case ((8, _)) ("առավոտվա", "առավոտվա");
				case ((9, _)) ("առավոտվա", "առավոտվա");
				case ((10, _)) ("առավոտվա", "առավոտվա");
				case ((11, _)) ("առավոտվա", "առավոտվա");
				case ((12, _)) ("ցերեկվա", "ցերեկվա");
				case ((13, _)) ("ցերեկվա", "ցերեկվա");
				case ((14, _)) ("ցերեկվա", "ցերեկվա");
				case ((15, _)) ("ցերեկվա", "ցերեկվա");
				case ((16, _)) ("ցերեկվա", "ցերեկվա");
				case ((17, _)) ("երեկոյան", "երեկոյան");
				case ((18, _)) ("երեկոյան", "երեկոյան");
				case ((19, _)) ("երեկոյան", "երեկոյան");
				case ((20, _)) ("երեկոյան", "երեկոյան");
				case ((21, _)) ("երեկոյան", "երեկոյան");
				case ((22, _)) ("երեկոյան", "երեկոյան");
				case ((23, _)) ("երեկոյան", "երեկոյան");
				case (_) Prelude.unreachable();
			};
			if (isLower) lower else upper;
		};
		getOrdinal = func (num : Nat) : Text {
			Prelude.unreachable();
		};
	};
};
