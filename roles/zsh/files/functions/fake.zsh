# Generate fake data, e.g. `fake name`, `fake url`, `fake email`
# Requires faker to be installed (pip install faker)
fake() {
    result=$(PYTHONIOENCODING=UTF-8 faker -s="" $1)
    echo "$result"
    echo "$result" | pbcopy
}
