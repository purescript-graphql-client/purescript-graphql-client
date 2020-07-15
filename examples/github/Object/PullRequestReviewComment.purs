module Examples.Github.Object.PullRequestReviewComment where

import Prelude
import GraphqlClient
import Data.Maybe
import Examples.Github.InputObject
import Examples.Github.Enum.ActionExecutionCapabilitySetting
import Examples.Github.Enum.AuditLogOrderField
import Examples.Github.Enum.CollaboratorAffiliation
import Examples.Github.Enum.CommentAuthorAssociation
import Examples.Github.Enum.CommentCannotUpdateReason
import Examples.Github.Enum.CommitContributionOrderField
import Examples.Github.Enum.DefaultRepositoryPermissionField
import Examples.Github.Enum.DeploymentOrderField
import Examples.Github.Enum.DeploymentState
import Examples.Github.Enum.DeploymentStatusState
import Examples.Github.Enum.DiffSide
import Examples.Github.Enum.EnterpriseAdministratorInvitationOrderField
import Examples.Github.Enum.EnterpriseAdministratorRole
import Examples.Github.Enum.EnterpriseDefaultRepositoryPermissionSettingValue
import Examples.Github.Enum.EnterpriseEnabledDisabledSettingValue
import Examples.Github.Enum.EnterpriseEnabledSettingValue
import Examples.Github.Enum.EnterpriseMemberOrderField
import Examples.Github.Enum.EnterpriseMembersCanCreateRepositoriesSettingValue
import Examples.Github.Enum.EnterpriseMembersCanMakePurchasesSettingValue
import Examples.Github.Enum.EnterpriseServerInstallationOrderField
import Examples.Github.Enum.EnterpriseServerUserAccountEmailOrderField
import Examples.Github.Enum.EnterpriseServerUserAccountOrderField
import Examples.Github.Enum.EnterpriseServerUserAccountsUploadOrderField
import Examples.Github.Enum.EnterpriseServerUserAccountsUploadSyncState
import Examples.Github.Enum.EnterpriseUserAccountMembershipRole
import Examples.Github.Enum.EnterpriseUserDeployment
import Examples.Github.Enum.FundingPlatform
import Examples.Github.Enum.GistOrderField
import Examples.Github.Enum.GistPrivacy
import Examples.Github.Enum.GitSignatureState
import Examples.Github.Enum.IdentityProviderConfigurationState
import Examples.Github.Enum.IpAllowListEnabledSettingValue
import Examples.Github.Enum.IpAllowListEntryOrderField
import Examples.Github.Enum.IssueOrderField
import Examples.Github.Enum.IssueState
import Examples.Github.Enum.IssueTimelineItemsItemType
import Examples.Github.Enum.LabelOrderField
import Examples.Github.Enum.LanguageOrderField
import Examples.Github.Enum.LockReason
import Examples.Github.Enum.MergeableState
import Examples.Github.Enum.MilestoneOrderField
import Examples.Github.Enum.MilestoneState
import Examples.Github.Enum.OauthApplicationCreateAuditEntryState
import Examples.Github.Enum.OperationType
import Examples.Github.Enum.OrderDirection
import Examples.Github.Enum.OrgAddMemberAuditEntryPermission
import Examples.Github.Enum.OrgCreateAuditEntryBillingPlan
import Examples.Github.Enum.OrgRemoveBillingManagerAuditEntryReason
import Examples.Github.Enum.OrgRemoveMemberAuditEntryMembershipType
import Examples.Github.Enum.OrgRemoveMemberAuditEntryReason
import Examples.Github.Enum.OrgRemoveOutsideCollaboratorAuditEntryMembershipType
import Examples.Github.Enum.OrgRemoveOutsideCollaboratorAuditEntryReason
import Examples.Github.Enum.OrgUpdateDefaultRepositoryPermissionAuditEntryPermission
import Examples.Github.Enum.OrgUpdateMemberAuditEntryPermission
import Examples.Github.Enum.OrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility
import Examples.Github.Enum.OrganizationInvitationRole
import Examples.Github.Enum.OrganizationInvitationType
import Examples.Github.Enum.OrganizationMemberRole
import Examples.Github.Enum.OrganizationMembersCanCreateRepositoriesSettingValue
import Examples.Github.Enum.OrganizationOrderField
import Examples.Github.Enum.PackageFileOrderField
import Examples.Github.Enum.PackageOrderField
import Examples.Github.Enum.PackageType
import Examples.Github.Enum.PackageVersionOrderField
import Examples.Github.Enum.PinnableItemType
import Examples.Github.Enum.ProjectCardArchivedState
import Examples.Github.Enum.ProjectCardState
import Examples.Github.Enum.ProjectColumnPurpose
import Examples.Github.Enum.ProjectOrderField
import Examples.Github.Enum.ProjectState
import Examples.Github.Enum.ProjectTemplate
import Examples.Github.Enum.PullRequestMergeMethod
import Examples.Github.Enum.PullRequestOrderField
import Examples.Github.Enum.PullRequestReviewCommentState
import Examples.Github.Enum.PullRequestReviewDecision
import Examples.Github.Enum.PullRequestReviewEvent
import Examples.Github.Enum.PullRequestReviewState
import Examples.Github.Enum.PullRequestState
import Examples.Github.Enum.PullRequestTimelineItemsItemType
import Examples.Github.Enum.PullRequestUpdateState
import Examples.Github.Enum.ReactionContent
import Examples.Github.Enum.ReactionOrderField
import Examples.Github.Enum.RefOrderField
import Examples.Github.Enum.ReleaseOrderField
import Examples.Github.Enum.RepoAccessAuditEntryVisibility
import Examples.Github.Enum.RepoAddMemberAuditEntryVisibility
import Examples.Github.Enum.RepoArchivedAuditEntryVisibility
import Examples.Github.Enum.RepoChangeMergeSettingAuditEntryMergeType
import Examples.Github.Enum.RepoCreateAuditEntryVisibility
import Examples.Github.Enum.RepoDestroyAuditEntryVisibility
import Examples.Github.Enum.RepoRemoveMemberAuditEntryVisibility
import Examples.Github.Enum.ReportedContentClassifiers
import Examples.Github.Enum.RepositoryAffiliation
import Examples.Github.Enum.RepositoryContributionType
import Examples.Github.Enum.RepositoryInvitationOrderField
import Examples.Github.Enum.RepositoryLockReason
import Examples.Github.Enum.RepositoryOrderField
import Examples.Github.Enum.RepositoryPermission
import Examples.Github.Enum.RepositoryPrivacy
import Examples.Github.Enum.RepositoryVisibility
import Examples.Github.Enum.SamlDigestAlgorithm
import Examples.Github.Enum.SamlSignatureAlgorithm
import Examples.Github.Enum.SavedReplyOrderField
import Examples.Github.Enum.SearchType
import Examples.Github.Enum.SecurityAdvisoryEcosystem
import Examples.Github.Enum.SecurityAdvisoryIdentifierType
import Examples.Github.Enum.SecurityAdvisoryOrderField
import Examples.Github.Enum.SecurityAdvisorySeverity
import Examples.Github.Enum.SecurityVulnerabilityOrderField
import Examples.Github.Enum.SponsorsTierOrderField
import Examples.Github.Enum.SponsorshipOrderField
import Examples.Github.Enum.SponsorshipPrivacy
import Examples.Github.Enum.StarOrderField
import Examples.Github.Enum.StatusState
import Examples.Github.Enum.SubscriptionState
import Examples.Github.Enum.TeamDiscussionCommentOrderField
import Examples.Github.Enum.TeamDiscussionOrderField
import Examples.Github.Enum.TeamMemberOrderField
import Examples.Github.Enum.TeamMemberRole
import Examples.Github.Enum.TeamMembershipType
import Examples.Github.Enum.TeamOrderField
import Examples.Github.Enum.TeamPrivacy
import Examples.Github.Enum.TeamRepositoryOrderField
import Examples.Github.Enum.TeamRole
import Examples.Github.Enum.TopicSuggestionDeclineReason
import Examples.Github.Enum.UserBlockDuration
import Examples.Github.Enum.UserStatusOrderField
import Examples.Github.Scopes
import Examples.Github.Scalars

author :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__PullRequestReviewComment (Maybe r)
author = selectionForCompositeField "author" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

authorAssociation :: SelectionSet Scope__PullRequestReviewComment CommentAuthorAssociation
authorAssociation = selectionForField "authorAssociation" [] graphqlDefaultResponseScalarDecoder

body :: SelectionSet Scope__PullRequestReviewComment String
body = selectionForField "body" [] graphqlDefaultResponseScalarDecoder

bodyHTML :: SelectionSet Scope__PullRequestReviewComment Html
bodyHTML = selectionForField "bodyHTML" [] graphqlDefaultResponseScalarDecoder

bodyText :: SelectionSet Scope__PullRequestReviewComment String
bodyText = selectionForField "bodyText" [] graphqlDefaultResponseScalarDecoder

commit :: forall r . SelectionSet Scope__Commit r -> SelectionSet Scope__PullRequestReviewComment (Maybe r)
commit = selectionForCompositeField "commit" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__PullRequestReviewComment DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

createdViaEmail :: SelectionSet Scope__PullRequestReviewComment Boolean
createdViaEmail = selectionForField "createdViaEmail" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__PullRequestReviewComment (Maybe Int)
databaseId = selectionForField "databaseId" [] graphqlDefaultResponseScalarDecoder

diffHunk :: SelectionSet Scope__PullRequestReviewComment String
diffHunk = selectionForField "diffHunk" [] graphqlDefaultResponseScalarDecoder

draftedAt :: SelectionSet Scope__PullRequestReviewComment DateTime
draftedAt = selectionForField "draftedAt" [] graphqlDefaultResponseScalarDecoder

editor :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__PullRequestReviewComment (Maybe r)
editor = selectionForCompositeField "editor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__PullRequestReviewComment Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

includesCreatedEdit :: SelectionSet Scope__PullRequestReviewComment Boolean
includesCreatedEdit = selectionForField "includesCreatedEdit" [] graphqlDefaultResponseScalarDecoder

isMinimized :: SelectionSet Scope__PullRequestReviewComment Boolean
isMinimized = selectionForField "isMinimized" [] graphqlDefaultResponseScalarDecoder

lastEditedAt :: SelectionSet Scope__PullRequestReviewComment (Maybe DateTime)
lastEditedAt = selectionForField "lastEditedAt" [] graphqlDefaultResponseScalarDecoder

minimizedReason :: SelectionSet Scope__PullRequestReviewComment (Maybe String)
minimizedReason = selectionForField "minimizedReason" [] graphqlDefaultResponseScalarDecoder

originalCommit :: forall r . SelectionSet Scope__Commit r -> SelectionSet Scope__PullRequestReviewComment (Maybe r)
originalCommit = selectionForCompositeField "originalCommit" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

originalPosition :: SelectionSet Scope__PullRequestReviewComment Int
originalPosition = selectionForField "originalPosition" [] graphqlDefaultResponseScalarDecoder

outdated :: SelectionSet Scope__PullRequestReviewComment Boolean
outdated = selectionForField "outdated" [] graphqlDefaultResponseScalarDecoder

path :: SelectionSet Scope__PullRequestReviewComment String
path = selectionForField "path" [] graphqlDefaultResponseScalarDecoder

position :: SelectionSet Scope__PullRequestReviewComment (Maybe Int)
position = selectionForField "position" [] graphqlDefaultResponseScalarDecoder

publishedAt :: SelectionSet Scope__PullRequestReviewComment (Maybe DateTime)
publishedAt = selectionForField "publishedAt" [] graphqlDefaultResponseScalarDecoder

pullRequest :: forall r . SelectionSet Scope__PullRequest r -> SelectionSet Scope__PullRequestReviewComment r
pullRequest = selectionForCompositeField "pullRequest" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pullRequestReview :: forall r . SelectionSet Scope__PullRequestReview r -> SelectionSet Scope__PullRequestReviewComment (Maybe r)
pullRequestReview = selectionForCompositeField "pullRequestReview" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

reactionGroups :: forall r . SelectionSet Scope__ReactionGroup r -> SelectionSet Scope__PullRequestReviewComment (Array r)
reactionGroups = selectionForCompositeField "reactionGroups" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ReactionsInput = { after :: Optional String
                      , before :: Optional String
                      , first :: Optional Int
                      , last :: Optional Int
                      , content :: Optional ReactionContent
                      , orderBy :: Optional ReactionOrder
                      }

reactions :: forall r . ReactionsInput -> SelectionSet Scope__ReactionConnection r -> SelectionSet Scope__PullRequestReviewComment r
reactions input = selectionForCompositeField "reactions" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

replyTo :: forall r . SelectionSet Scope__PullRequestReviewComment r -> SelectionSet Scope__PullRequestReviewComment (Maybe r)
replyTo = selectionForCompositeField "replyTo" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repository :: forall r . SelectionSet Scope__Repository r -> SelectionSet Scope__PullRequestReviewComment r
repository = selectionForCompositeField "repository" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__PullRequestReviewComment Uri
resourcePath = selectionForField "resourcePath" [] graphqlDefaultResponseScalarDecoder

state :: SelectionSet Scope__PullRequestReviewComment PullRequestReviewCommentState
state = selectionForField "state" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__PullRequestReviewComment DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__PullRequestReviewComment Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

type UserContentEditsInput = { after :: Optional String
                             , before :: Optional String
                             , first :: Optional Int
                             , last :: Optional Int
                             }

userContentEdits :: forall r . UserContentEditsInput -> SelectionSet Scope__UserContentEditConnection r -> SelectionSet Scope__PullRequestReviewComment (Maybe r)
userContentEdits input = selectionForCompositeField "userContentEdits" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

viewerCanDelete :: SelectionSet Scope__PullRequestReviewComment Boolean
viewerCanDelete = selectionForField "viewerCanDelete" [] graphqlDefaultResponseScalarDecoder

viewerCanMinimize :: SelectionSet Scope__PullRequestReviewComment Boolean
viewerCanMinimize = selectionForField "viewerCanMinimize" [] graphqlDefaultResponseScalarDecoder

viewerCanReact :: SelectionSet Scope__PullRequestReviewComment Boolean
viewerCanReact = selectionForField "viewerCanReact" [] graphqlDefaultResponseScalarDecoder

viewerCanUpdate :: SelectionSet Scope__PullRequestReviewComment Boolean
viewerCanUpdate = selectionForField "viewerCanUpdate" [] graphqlDefaultResponseScalarDecoder

viewerCannotUpdateReasons :: SelectionSet Scope__PullRequestReviewComment (Array CommentCannotUpdateReason)
viewerCannotUpdateReasons = selectionForField "viewerCannotUpdateReasons" [] graphqlDefaultResponseScalarDecoder

viewerDidAuthor :: SelectionSet Scope__PullRequestReviewComment Boolean
viewerDidAuthor = selectionForField "viewerDidAuthor" [] graphqlDefaultResponseScalarDecoder