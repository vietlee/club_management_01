# if [ -z "${CI_PULL_REQUEST}" ]; then
# echo gem install
gem install --no-document pronto pronto-rubocop pronto-brakeman pronto-reek pronto-rails_best_practices pronto-eslint

echo run review
echo ${GITHUB_ACCESS_TOKEN} - ${CI_PULL_REQUEST##*/}
PRONTO_GITHUB_ACCESS_TOKEN=${GITHUB_ACCESS_TOKEN} PRONTO_PULL_REQUEST_ID=${CI_PULL_REQUEST##*/} pronto run -f github_pr -c origin/develop
# fi
