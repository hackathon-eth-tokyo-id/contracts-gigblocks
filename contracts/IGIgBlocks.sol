// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./GigBlocksEnums.sol";

interface IGigBlocks {
        struct Job {
        uint256 id;
        address client;
        address freelancer;
        string jobDetailsIPFS;
        uint256 payment;
        uint256 deadline;
        bool isPaid;
        GigBlocksEnums.JobCategory category;
        GigBlocksEnums.JobStatus status;
        uint256 applicantCount;
    }

    struct Applicant {
        string freelancerName;
        address freelancerWalletAddress;
        string freelancerEmail;
        uint256 bidAmount;
        uint256 bidTime;
        string coverLetter;
    }

    //Job Functions
    function createJob(string memory _jobDetailsIPFS, GigBlocksEnums.JobCategory _category) external;
    function updateJobDetails(uint256 _jobId, string calldata _jobDetailsIPFS) external;
    function applyForJob(uint256 _jobId, string memory _name, string memory _email, uint256 _bidAmount, uint256 _bidTime, string memory _coverLetter) external;
    //View Functions
    function getActiveJobs(uint256 _offset, uint256 _limit) external view returns (Job[] memory);
    function getJobById(uint256 _jobId) external view returns (Job memory);
    function getJobApplicants(uint256 _jobId, uint256 _offset, uint256 _limit) external view returns (Applicant[] memory);
    function getActiveJobCount() external view returns (uint256);
    function getJobApplicantCount(uint256 _jobId) external view returns (uint256);
}