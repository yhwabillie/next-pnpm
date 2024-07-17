## :memo: Title: next-pnpm
패키지 매니저 pnpm으로 빌드한 NextJS 기본 템플릿입니다.  
`pnpm store prune` 명령어로 pnpm의 cache를 삭제 후 측정하였습니다.

1) [🏠로컬] Dependency install 시간  
2) [🏠로컬] Dependency 크기  
3) [🏠로컬] .next 빌드 결과물 크기    
4) [🐳Docker] 로컬 이미지 크기 
5) [🐳Docker] 로컬 이미지 build 시간
6) [⛓️Github Actions] Code Push&Build full workflow 시간
7) [⛓️Github Actions] Build Job 시간
8) [⛓️Github Actions] Build Step 시간

:mag: 위 조건들을 기준으로 패키지 매니저별 비교 학습하기 위해 만들었습니다.   
:mag: 대략적인 수치를 알기 위한 것으로, 오차가 있을 수 있습니다.

## :pushpin: Dev Enviroment
Node (v20.11.1)  
PNPM (v.9.5.0)  
NextJS (v.14.2.5), output: standalone 

## :pushpin: Dev Dependencies
prettier (v3)
