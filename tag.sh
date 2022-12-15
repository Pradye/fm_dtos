tag_name="${1:-last_successful}"
echo "Tagging as $tag_name"
git tag -f "$tag_name"
git push -f origin "refs/tags/$tag_name"
