Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCD99233149
	for <lists+kernel-janitors@lfdr.de>; Thu, 30 Jul 2020 13:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbgG3Lwr (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 30 Jul 2020 07:52:47 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:41276 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbgG3Lwr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 30 Jul 2020 07:52:47 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06UBq1hP149260;
        Thu, 30 Jul 2020 11:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=zbUphS4qE6L97k0ga9ayvUf7G7N7QVXOnuyIF7tCLn0=;
 b=wz13wkdHLr/MxWAftEFoCyTLXll6/CFtdYYvJOwUnPU2FMzraOdOOapItW92zJ6zfeAi
 JOskDgghdnXKjskCAY3HbYQXDMDeKbz9/T+eF1TFSgzr4IO2m+2TQm3kW9naxh3rmLmS
 SNHrtFOdbbZ/i0oc9CEp5xivMEZ41o+w5Jz1YCk1IFqiAsaBf2qf2Pwf7NbAtdZ1CefB
 6YVl1bw9dAbOsnIKmvQK4PdIw+oO7Hq/V3qPz8SmEcH/4EUqXQkz95yQov0IBIRaW+qp
 lPaBW0cFMCQBDqIfUSeW5GkTaqG9uVSX/5/Gs92uO33L7oKNEb+K27NsrHWazh5Bs4O0 QQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 32hu1jk61h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 30 Jul 2020 11:52:40 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06UBmXEC143638;
        Thu, 30 Jul 2020 11:52:40 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 32hu60tq2a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 30 Jul 2020 11:52:40 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06UBqa1q019723;
        Thu, 30 Jul 2020 11:52:36 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 30 Jul 2020 04:52:35 -0700
Date:   Thu, 30 Jul 2020 14:52:26 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Harry Wentland <harry.wentland@amd.com>,
        Eryk Brol <eryk.brol@amd.com>
Cc:     Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        Mikita Lipski <mikita.lipski@amd.com>,
        Stylon Wang <stylon.wang@amd.com>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        Anthony Koo <Anthony.Koo@amd.com>,
        Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
        Qingqing Zhuo <qingqing.zhuo@amd.com>,
        amd-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/amd/display: fix dp_dsc_clock_en_read() debugfs
 function
Message-ID: <20200730115225.GG5493@kadam>
References: <20200730114613.GA59409@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200730114613.GA59409@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9697 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007300088
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9697 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 clxscore=1015 mlxscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007300088
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The other debugfs functions should probably be updated as well...  I
just did this one as an example of how these functions are normally
implemented.

There are some other warnings we could look at as well.

regards,
dan carpenter

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:683 dp_phy_test_pattern_debugfs_write() warn: we tested 'valid_test_pattern' before and it was 'true'
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1005 dp_dsc_clock_en_read() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1005 dp_dsc_clock_en_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1010 dp_dsc_clock_en_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1019 dp_dsc_clock_en_read() error: snprintf() is printing too much 30 vs 10
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1062 dp_dsc_slice_width_read() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1062 dp_dsc_slice_width_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1067 dp_dsc_slice_width_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1119 dp_dsc_slice_height_read() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1119 dp_dsc_slice_height_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1124 dp_dsc_slice_height_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1176 dp_dsc_bits_per_pixel_read() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1176 dp_dsc_bits_per_pixel_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1181 dp_dsc_bits_per_pixel_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1233 dp_dsc_pic_width_read() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1233 dp_dsc_pic_width_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1238 dp_dsc_pic_width_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1290 dp_dsc_pic_height_read() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1290 dp_dsc_pic_height_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1295 dp_dsc_pic_height_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1347 dp_dsc_chunk_size_read() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1347 dp_dsc_chunk_size_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1352 dp_dsc_chunk_size_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1404 dp_dsc_slice_bpg_offset_read() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1404 dp_dsc_slice_bpg_offset_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1409 dp_dsc_slice_bpg_offset_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL

