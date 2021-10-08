<?php
// This file is part of Moodle - http://moodle.org/
//
// Moodle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Moodle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Moodle.  If not, see <http://www.gnu.org/licenses/>.

/**
 * Steps definitions for search courses block.
 *
 * @package   block_searchcourses
 * @category  test
 * @copyright 2020 Amanda Doughty
 * @license   http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */

// NOTE: no MOODLE_INTERNAL test here, this file may be required by behat before including /config.php.

require_once(__DIR__ . '/../../../../lib/behat/behat_base.php');
require_once(__DIR__ . '/../../../../lib/tests/behat/behat_general.php');
require_once(__DIR__ . '/../../../../lib/tests/behat/behat_forms.php');

use Behat\Mink\Exception\ExpectationException as ExpectationException;

/**
 * Search courses definitions.
 *
 * @package   block_searchcourses
 * @category  test
 * @copyright 2020 Amanda Doughty
 * @license   http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */
class behat_block_searchcourses extends behat_base {
    /**
     * Send key presses to the browser without first changing focusing, or applying the key presses to a specific
     * element.
     *
     * Example usage of this step:
     *     When I type "Penguin"
     *
     * @When    I type :keys in search courses 
     * @param   string $keys The key, or list of keys, to type
     */
    public function i_type_in_search_courses(string $keys): void {
        $this->execute('behat_general::i_type', [$keys]);
        $this->wait_for_pending_js();
    }
}