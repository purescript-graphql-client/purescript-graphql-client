module Examples.Github.Object.TeamDiscussion where

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

author :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__TeamDiscussion (Maybe r)
author = selectionForCompositeField "author" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

authorAssociation :: SelectionSet Scope__TeamDiscussion CommentAuthorAssociation
authorAssociation = selectionForField "authorAssociation" [] graphqlDefaultResponseScalarDecoder

body :: SelectionSet Scope__TeamDiscussion String
body = selectionForField "body" [] graphqlDefaultResponseScalarDecoder

bodyHTML :: SelectionSet Scope__TeamDiscussion Html
bodyHTML = selectionForField "bodyHTML" [] graphqlDefaultResponseScalarDecoder

bodyText :: SelectionSet Scope__TeamDiscussion String
bodyText = selectionForField "bodyText" [] graphqlDefaultResponseScalarDecoder

bodyVersion :: SelectionSet Scope__TeamDiscussion String
bodyVersion = selectionForField "bodyVersion" [] graphqlDefaultResponseScalarDecoder

type CommentsInput = { after :: Optional String
                     , before :: Optional String
                     , first :: Optional Int
                     , last :: Optional Int
                     , orderBy :: Optional TeamDiscussionCommentOrder
                     , fromComment :: Optional Int
                     }

comments :: forall r . CommentsInput -> SelectionSet Scope__TeamDiscussionCommentConnection r -> SelectionSet Scope__TeamDiscussion r
comments input = selectionForCompositeField "comments" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

commentsResourcePath :: SelectionSet Scope__TeamDiscussion Uri
commentsResourcePath = selectionForField "commentsResourcePath" [] graphqlDefaultResponseScalarDecoder

commentsUrl :: SelectionSet Scope__TeamDiscussion Uri
commentsUrl = selectionForField "commentsUrl" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__TeamDiscussion DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

createdViaEmail :: SelectionSet Scope__TeamDiscussion Boolean
createdViaEmail = selectionForField "createdViaEmail" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__TeamDiscussion (Maybe Int)
databaseId = selectionForField "databaseId" [] graphqlDefaultResponseScalarDecoder

editor :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__TeamDiscussion (Maybe r)
editor = selectionForCompositeField "editor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__TeamDiscussion Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

includesCreatedEdit :: SelectionSet Scope__TeamDiscussion Boolean
includesCreatedEdit = selectionForField "includesCreatedEdit" [] graphqlDefaultResponseScalarDecoder

isPinned :: SelectionSet Scope__TeamDiscussion Boolean
isPinned = selectionForField "isPinned" [] graphqlDefaultResponseScalarDecoder

isPrivate :: SelectionSet Scope__TeamDiscussion Boolean
isPrivate = selectionForField "isPrivate" [] graphqlDefaultResponseScalarDecoder

lastEditedAt :: SelectionSet Scope__TeamDiscussion (Maybe DateTime)
lastEditedAt = selectionForField "lastEditedAt" [] graphqlDefaultResponseScalarDecoder

number :: SelectionSet Scope__TeamDiscussion Int
number = selectionForField "number" [] graphqlDefaultResponseScalarDecoder

publishedAt :: SelectionSet Scope__TeamDiscussion (Maybe DateTime)
publishedAt = selectionForField "publishedAt" [] graphqlDefaultResponseScalarDecoder

reactionGroups :: forall r . SelectionSet Scope__ReactionGroup r -> SelectionSet Scope__TeamDiscussion (Array r)
reactionGroups = selectionForCompositeField "reactionGroups" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ReactionsInput = { after :: Optional String
                      , before :: Optional String
                      , first :: Optional Int
                      , last :: Optional Int
                      , content :: Optional ReactionContent
                      , orderBy :: Optional ReactionOrder
                      }

reactions :: forall r . ReactionsInput -> SelectionSet Scope__ReactionConnection r -> SelectionSet Scope__TeamDiscussion r
reactions input = selectionForCompositeField "reactions" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__TeamDiscussion Uri
resourcePath = selectionForField "resourcePath" [] graphqlDefaultResponseScalarDecoder

team :: forall r . SelectionSet Scope__Team r -> SelectionSet Scope__TeamDiscussion r
team = selectionForCompositeField "team" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

title :: SelectionSet Scope__TeamDiscussion String
title = selectionForField "title" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__TeamDiscussion DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__TeamDiscussion Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

type UserContentEditsInput = { after :: Optional String
                             , before :: Optional String
                             , first :: Optional Int
                             , last :: Optional Int
                             }

userContentEdits :: forall r . UserContentEditsInput -> SelectionSet Scope__UserContentEditConnection r -> SelectionSet Scope__TeamDiscussion (Maybe r)
userContentEdits input = selectionForCompositeField "userContentEdits" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

viewerCanDelete :: SelectionSet Scope__TeamDiscussion Boolean
viewerCanDelete = selectionForField "viewerCanDelete" [] graphqlDefaultResponseScalarDecoder

viewerCanPin :: SelectionSet Scope__TeamDiscussion Boolean
viewerCanPin = selectionForField "viewerCanPin" [] graphqlDefaultResponseScalarDecoder

viewerCanReact :: SelectionSet Scope__TeamDiscussion Boolean
viewerCanReact = selectionForField "viewerCanReact" [] graphqlDefaultResponseScalarDecoder

viewerCanSubscribe :: SelectionSet Scope__TeamDiscussion Boolean
viewerCanSubscribe = selectionForField "viewerCanSubscribe" [] graphqlDefaultResponseScalarDecoder

viewerCanUpdate :: SelectionSet Scope__TeamDiscussion Boolean
viewerCanUpdate = selectionForField "viewerCanUpdate" [] graphqlDefaultResponseScalarDecoder

viewerCannotUpdateReasons :: SelectionSet Scope__TeamDiscussion (Array CommentCannotUpdateReason)
viewerCannotUpdateReasons = selectionForField "viewerCannotUpdateReasons" [] graphqlDefaultResponseScalarDecoder

viewerDidAuthor :: SelectionSet Scope__TeamDiscussion Boolean
viewerDidAuthor = selectionForField "viewerDidAuthor" [] graphqlDefaultResponseScalarDecoder

viewerSubscription :: SelectionSet Scope__TeamDiscussion (Maybe SubscriptionState)
viewerSubscription = selectionForField "viewerSubscription" [] graphqlDefaultResponseScalarDecoder