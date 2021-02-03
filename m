Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFC2C30E705
	for <lists+kernel-janitors@lfdr.de>; Thu,  4 Feb 2021 00:16:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233441AbhBCXPm (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 3 Feb 2021 18:15:42 -0500
Received: from mga11.intel.com ([192.55.52.93]:32818 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233293AbhBCW62 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 Feb 2021 17:58:28 -0500
IronPort-SDR: PirixZxeuI21hlhP4J7/T45rebIzTi5dm9iWfcgWU3n1hXaukLH3AroWPTER+GNyMJ7T9Shpf7
 baWFhIhGxWag==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="177626047"
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; 
   d="scan'208";a="177626047"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2021 14:57:38 -0800
IronPort-SDR: xCJsImGKbFOmu/m5LuoSmcrf4BTlgaxhrfnpng+C36AA8Z5A8dk+gqERSHbmCexFQXUSFWOH70
 TlyevTEs4PTw==
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; 
   d="scan'208";a="406863758"
Received: from jbrandeb-mobl4.amr.corp.intel.com (HELO localhost) ([10.209.23.15])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2021 14:57:38 -0800
Date:   Wed, 3 Feb 2021 14:57:36 -0800
From:   Jesse Brandeburg <jesse.brandeburg@intel.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Saeed Mahameed <saeedm@nvidia.com>,
        Leon Romanovsky <leon@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, <netdev@vger.kernel.org>,
        <linux-rdma@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH][next] net/mlx5e: Fix spelling mistake "Unknouwn" ->
 "Unknown"
Message-ID: <20210203145736.00005b7b@intel.com>
In-Reply-To: <20210203111049.18125-1-colin.king@canonical.com>
References: <20210203111049.18125-1-colin.king@canonical.com>
X-Mailer: Claws Mail 3.12.0 (GTK+ 2.24.28; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a netdev_warn message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Trivial patch, looks fine!

Reviewed-by: Jesse Brandeburg <jesse.brandeburg@intel.com>
