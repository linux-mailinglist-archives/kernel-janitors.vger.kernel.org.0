Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE810735FD6
	for <lists+kernel-janitors@lfdr.de>; Tue, 20 Jun 2023 00:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbjFSW3T (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 19 Jun 2023 18:29:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbjFSW3Q (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Jun 2023 18:29:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C470118
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 15:29:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3234960F28
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 22:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F40C433C0;
        Mon, 19 Jun 2023 22:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687213753;
        bh=VTOn8TZIRkr5hcTwCFN624AmM4XHhsXL5EFuVLuRufE=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=L2HS91ARE+lTOqsWF6lhYxQkY5E2QL8FpAC2QPjiBfDM2u9/emMwksPxNp2Lh+2im
         ubiOCJ9ujrU3iX1uwh6wbQvX+NN0HLrQ3sJg0mrv5Hn5nc0wpCoQTGBa/Di1ZphcPB
         siAiVrvsTuVEshRM9TydI6oDE4sVHNAP5qAdvSn2WOUuSRb5VuV4RjlG6vBTijjb80
         Q2zEpLIWgEs0tnHS7wc1s+ll0DV9tmE8suHJTfbZG4Z7/1/JD1A/tQIyoXnsGUwV9s
         v6gvGVQor3MbStL7BgJjP+7JpTXsQuudJ0kr4g0zaE3YKMycbIOOv1xJ9U9r/uFJTi
         xBK8RFTDU9bhw==
From:   Mark Brown <broonie@kernel.org>
To:     Ryan Lee <ryans.lee@analog.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
In-Reply-To: <d44c8388-b12b-4045-95de-0d4bc7b428ac@moroto.mountain>
References: <d44c8388-b12b-4045-95de-0d4bc7b428ac@moroto.mountain>
Subject: Re: [PATCH] ASoC: max98388: fix error code in probe()
Message-Id: <168721375195.200161.4552209882264201706.b4-ty@kernel.org>
Date:   Mon, 19 Jun 2023 23:29:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 19 Jun 2023 12:46:48 +0300, Dan Carpenter wrote:
> This seems like a copy and paste bug.  Return the correct variable.
> It should be "ret" instead of PTR_ERR(max98388->regmap).
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: max98388: fix error code in probe()
      commit: 02474880e8fdd8533f21da4264a7ebfce8196be7

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

