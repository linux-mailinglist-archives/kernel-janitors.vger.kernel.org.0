Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D36A46B2668
	for <lists+kernel-janitors@lfdr.de>; Thu,  9 Mar 2023 15:12:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjCIOMT (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 9 Mar 2023 09:12:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231714AbjCIOLg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 9 Mar 2023 09:11:36 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8DFE5D513
        for <kernel-janitors@vger.kernel.org>; Thu,  9 Mar 2023 06:10:25 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0933AD7;
        Thu,  9 Mar 2023 06:11:08 -0800 (PST)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 87FEF3F5A1;
        Thu,  9 Mar 2023 06:10:24 -0800 (PST)
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Cristian Marussi <cristian.marussi@arm.com>,
        Dan Carpenter <error27@gmail.com>
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: return a literal instead of a variable
Date:   Thu,  9 Mar 2023 14:10:17 +0000
Message-Id: <167837075463.2091199.5138881383747503580.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <Y/Yx8pOdf8rNhPVe@kili>
References: <Y/Yx8pOdf8rNhPVe@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 22 Feb 2023 18:17:06 +0300, Dan Carpenter wrote:
> In this context "return scmi_dev;" and "return NULL;" are equivalent
> but it is more readable to return a literal.
> 

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: return a literal instead of a variable
      https://git.kernel.org/sudeep.holla/c/6bed395d7db2
--
Regards,
Sudeep

