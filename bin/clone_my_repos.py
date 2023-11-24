#!/usr/bin/env python3
import os
import subprocess
from github import Github

src_dir = os.getenv('SRC_ROOT', os.path.expanduser('~') + '/src')
print ('Source directory is', src_dir)
result = subprocess.run(['gh', 'auth', 'token'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
acces_token = result.stdout.decode('utf-8').strip()

g = Github(acces_token)
for r in g.get_user().get_repos():
    if not r.archived and not r.fork:
        org_path = src_dir + '/' + r.owner.login
        if not os.path.isdir(org_path):
            os.makedirs(org_path)
        repo_path = org_path + '/' + r.name
        if not os.path.isdir(repo_path):
            print('Cloning', r.owner.login+'/'+r.name)
            subprocess.check_call(['git', 'clone', r.ssh_url], cwd=org_path)
