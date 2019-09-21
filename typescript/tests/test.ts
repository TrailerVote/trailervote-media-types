import {AudioFragmentIndexV1, AudioFragmentV1 } from '../application/vnd.trailervote.audio_fragment'
import {CarouselV1} from '../application/vnd.trailervote.carousel'
import {ClientConfigurationV1} from '../application/vnd.trailervote.client_configuration'
import {ConfigurationV1, ConfigurationV2} from '../application/vnd.trailervote.configuration'
import { ErrorsV1 } from '../application/vnd.trailervote.errors'
import { FeedbackV1, FeedbackCreateV1, FeedbackCollectionV1 } from '../application/vnd.trailervote.feedback'
import { FeedbackListingV1 } from '../application/vnd.trailervote.feedback_listing'

import audioJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.audio_fragment.v1.json'
import audioIndexJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.audio_fragment.v1.index.json'
import audioOrderedJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.audio_fragment.v1.ordered.json'
import carouselJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.carousel.v1.json'
import clientConfigurationJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.client_configuration.v1.json'
import configurationV1Json from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.configuration.v1.json'
import configurationV2Json from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.configuration.v2.json'
import ErrorsJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.errors.v1.json'
import FeedbackJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.feedback.v1.json'
import FeedbackCreateJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.feedback.v1.create.json'
import FeedbackCollectionJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.feedback.v1.collection.json'
import FeedbackListingJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.feedback_listing.v1.json'


// Fixtures can not be imported with their original names.
// Run yarn fix-fixtures to fix their names

const audio = audioJson as AudioFragmentV1
const audioIndex = audioIndexJson as AudioFragmentIndexV1
const audioOrdered = audioOrderedJson // TODO: missing in Typescript

const carousel = carouselJson as CarouselV1

const clientConfiguration = clientConfigurationJson as ClientConfigurationV1

const configurationV1 = configurationV1Json as ConfigurationV1
const configurationV2 = configurationV2Json as ConfigurationV2

const errors = ErrorsJson as ErrorsV1

const feedback = FeedbackJson as FeedbackV1
const feedbackCreate = FeedbackCreateJson as FeedbackCreateV1
const feedbackCollection = FeedbackCollectionJson as FeedbackCollectionV1
const feedbackListing = FeedbackListingJson as FeedbackListingV1
