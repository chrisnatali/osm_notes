# GridMaps Work Functional Modules

These are the modules that need research/work done for a maintainable energy planning data collection solution.
The solution should be based off of the systems supporting [openstreetmap](http://wiki.openstreetmap.org).  

In particular, this [component overview](http://wiki.openstreetmap.org/wiki/Component_overview) describes an architecture which can be drawn from to implement gridmaps.  

### Architecture Definition

Deployment and data/system evolution architectural design scenarios need to be developed.  
Terminology needs to be defined.  

### Schemas

We need standard schemas for power data gathering and infrastructure data in general.  

The standard format for schemas in OSM is the "preset", which defines the [tags](http://wiki.openstreetmap.org/wiki/Tags) that can be associated with an entity.  Many available presets can be found [here](https://josm.openstreetmap.de/wiki/Presets), including our own definition for Nigerian [Power Line Mapping](https://josm.openstreetmap.de/wiki/Presets/Power_Mapping_Utility_Simple).  

There are established [infrastructure preset definitions](http://wiki.openstreetmap.org/wiki/Humanitarian_OSM_Tags/HDM_preset#Utilities) available.  

#### Schemas TODO:
Standard approaches need to be developed around presets:
- Authoring 
- Deployment (for both JOSM and potentially iD/mobile editor usage)
- Sync with [Reporting](#reporting) system

### Reporting

Our solution requires visibility into the progress of the collection effort as well as support for ad-hoc querying of collected data.  

#### Reporting TODO:
This can be done via the following:
- Synchronization between the OSM API server and a "tiling" server (either via osmosis or osm2pgsql)
  Research needs to be done.  
- TileMill or other tiling server and styles for generating/hosting reporting tiles
- Pre-defined and adhoc query support via [overpass api](http://wiki.openstreetmap.org/wiki/Overpass_API)

All of the above require [devops](#devops) work and customization

OUT OF SCOPE:  Custom "branded" reporting sites for specific entities.  

### Administration

User registration/editing workflow and reporting definition/access need to be defined. 

Current OSM roles are limited to moderators/administrators, which may be sufficient.  

#### Administration TODO:  
- Authentication needs to be researched and designed
- Entitlements between systems needs to be thought through.  
- We may want the ability to create "tasks" to be selected by/assigned to users as is done via the HOT Tasking Manager (though their grid-based assignment may not be optimal for our more network focused data collection).  This would be done via the [Data Automation](#data-automation) module. 

This may be integrated with [Quality Assurance](#quality-assurance).  

### Quality Assurance

User edits will need continuous validation via a combination of manual checks and automated bots.  These can be tagged as `k=FIXME` (manual) or some other tag for automatically detected errors.  There are [many existing tools available for QA](http://wiki.openstreetmap.org/wiki/Quality_assurance).

#### Quality Assurance TODO: 
- Define commonly found errors in our work
- Evaluate Overpass for defining automated checks.  [Examples here](http://wiki.openstreetmap.org/wiki/Overpass_turbo/Examples)
- Evaluate JOSM for manually detecting errors

### DevOps

All sub-components of the architecture need deployment automation, backups where needed and generally streamlined workflows for changes.  

#### DevOps TODO:  
- Development and Deployment automation with clear documentation
- Database backups on regular schedule with recovery tested in test environment
- Workflow for reconciling upstream openstreetmap with custom gridmaps software

#### Monitoring

We need to know the health of the system and its components so that we can resolve any issues BEFORE users are affected.  
This is part of devops, but a large enough task that it justifies its own tasks/schedule.  

### Mobile Client Editor

JOSM may be sufficient for desktop editors, but for those out in the field a more suitable mobile/offline editor is needed.  

I believe this should be based on the source for iD editor. 

#### Mobile Client Editor TODO:
- Evaluate iD and determine effort to add mobile/offline capabilities

### Conflation (Import):

Since existing sources will be a major contributor to GridMaps repositories, a methodology for matching and integration of these sources with existing repository data (i.e. Conflation) needs developing.  There are some [existing tools](http://wiki.openstreetmap.org/wiki/Conflation) for this.  

### Export:

Since only simple analysis can be done via this framework, export to various formats will be required.  These will likely need to be customizeable to mitigate the difference in the flexibility of the OSM tag-based format and those being exported to.  

### Data Automation

As the size/scope of the dataset grows, automation of collection and fixing becomes more critical to the quality of the data.  

#### Data Automation TODO:
- Evaluate HOT Tasking Manager, MapRoulette for applicability

#### Documentation

We can reuse much of what the OSM community has developed, but may need some customizations specific to our needs


