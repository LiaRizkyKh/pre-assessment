function areAnagrams(str1, str2) {
    if (str1.length !== str2.length) return false;

    const charCount = {};

    for (let char of str1) {
        charCount[char] = (charCount[char] || 0) + 1;
    }

    for (let char of str2) {
        if (!charCount[char]) return false;
        charCount[char] -= 1;
    }

    return true;
}

function groupAnagrams(strings) {
    const result = [];
    const grouped = {};

    for (let str of strings) {
        let added = false;

        for (let group in grouped) {
            if (areAnagrams(group, str)) {
                grouped[group].push(str);
                added = true;
                break;
            }
        }

        if (!added) {
            grouped[str] = [str];
        }
    }

    for (let group in grouped) {
        result.push(grouped[group]);
    }

    return result;
}

const inputArray = ['cook', 'save', 'taste', 'aves', 'vase', 'state', 'map'];
const groupedAnagrams = groupAnagrams(inputArray);

console.log(groupedAnagrams);