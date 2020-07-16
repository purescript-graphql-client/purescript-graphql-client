module Examples.Github.Interface.UniformResourceLocatable where

import Prelude
import GraphqlClient
import Data.Maybe
import Examples.Github.InputObject
import Type.Row
import Examples.Github.Scopes
import Examples.Github.Scalars
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

resourcePath :: SelectionSet Scope__UniformResourceLocatable Uri
resourcePath = selectionForField "resourcePath" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__UniformResourceLocatable Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

type Fragments decodesTo = { onBot :: SelectionSet Scope__Bot decodesTo
                           , onClosedEvent :: SelectionSet Scope__ClosedEvent decodesTo
                           , onCommit :: SelectionSet Scope__Commit decodesTo
                           , onConvertToDraftEvent :: SelectionSet Scope__ConvertToDraftEvent decodesTo
                           , onCrossReferencedEvent :: SelectionSet Scope__CrossReferencedEvent decodesTo
                           , onGist :: SelectionSet Scope__Gist decodesTo
                           , onIssue :: SelectionSet Scope__Issue decodesTo
                           , onMannequin :: SelectionSet Scope__Mannequin decodesTo
                           , onMergedEvent :: SelectionSet Scope__MergedEvent decodesTo
                           , onMilestone :: SelectionSet Scope__Milestone decodesTo
                           , onOrganization :: SelectionSet Scope__Organization decodesTo
                           , onPullRequest :: SelectionSet Scope__PullRequest decodesTo
                           , onPullRequestCommit :: SelectionSet Scope__PullRequestCommit decodesTo
                           , onReadyForReviewEvent :: SelectionSet Scope__ReadyForReviewEvent decodesTo
                           , onRelease :: SelectionSet Scope__Release decodesTo
                           , onRepository :: SelectionSet Scope__Repository decodesTo
                           , onRepositoryTopic :: SelectionSet Scope__RepositoryTopic decodesTo
                           , onReviewDismissedEvent :: SelectionSet Scope__ReviewDismissedEvent decodesTo
                           , onTeamDiscussion :: SelectionSet Scope__TeamDiscussion decodesTo
                           , onTeamDiscussionComment :: SelectionSet Scope__TeamDiscussionComment decodesTo
                           , onUser :: SelectionSet Scope__User decodesTo
                           }

fragments :: forall decodesTo . Fragments decodesTo -> SelectionSet Scope__UniformResourceLocatable decodesTo
fragments selections = exhaustiveFragmentSelection [buildFragment "Bot" selections.onBot, buildFragment "ClosedEvent" selections.onClosedEvent, buildFragment "Commit" selections.onCommit, buildFragment "ConvertToDraftEvent" selections.onConvertToDraftEvent, buildFragment "CrossReferencedEvent" selections.onCrossReferencedEvent, buildFragment "Gist" selections.onGist, buildFragment "Issue" selections.onIssue, buildFragment "Mannequin" selections.onMannequin, buildFragment "MergedEvent" selections.onMergedEvent, buildFragment "Milestone" selections.onMilestone, buildFragment "Organization" selections.onOrganization, buildFragment "PullRequest" selections.onPullRequest, buildFragment "PullRequestCommit" selections.onPullRequestCommit, buildFragment "ReadyForReviewEvent" selections.onReadyForReviewEvent, buildFragment "Release" selections.onRelease, buildFragment "Repository" selections.onRepository, buildFragment "RepositoryTopic" selections.onRepositoryTopic, buildFragment "ReviewDismissedEvent" selections.onReviewDismissedEvent, buildFragment "TeamDiscussion" selections.onTeamDiscussion, buildFragment "TeamDiscussionComment" selections.onTeamDiscussionComment, buildFragment "User" selections.onUser]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onBot: pure Nothing, onClosedEvent: pure Nothing, onCommit: pure Nothing, onConvertToDraftEvent: pure Nothing, onCrossReferencedEvent: pure Nothing, onGist: pure Nothing, onIssue: pure Nothing, onMannequin: pure Nothing, onMergedEvent: pure Nothing, onMilestone: pure Nothing, onOrganization: pure Nothing, onPullRequest: pure Nothing, onPullRequestCommit: pure Nothing, onReadyForReviewEvent: pure Nothing, onRelease: pure Nothing, onRepository: pure Nothing, onRepositoryTopic: pure Nothing, onReviewDismissedEvent: pure Nothing, onTeamDiscussion: pure Nothing, onTeamDiscussionComment: pure Nothing, onUser: pure Nothing }
