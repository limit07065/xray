<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DICOMViewer.aspx.cs" Inherits="MRME_Default3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DICOM Viewer</title>
    <link href="../css/cornerstone.min.css" rel="stylesheet" type="text/css" />
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="loading" style="padding-left: 20px;">
        <img src="../images/loading.jpg" />
    </div>
    <div id="dicom">
        <input type="hidden" id="wadoURL" value="../images/IM-0001-1001.dcm">
        <div id="dicomImage" style="width: 100%;height:100%;top:0px;left:0px; position:absolute">
        </div>  
    </div>
    </form>

    
    <!-- jquery - currently a dependency and thus required for using cornerstoneWADOImageLoader -->
    <script src="../plugins/jQuery/jquery-2.2.3.min.js" type="text/javascript"></script>

    <!-- bootstrap -->
    <script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    
    <!-- include the cornerstone library -->
    <script src="../js/cornerstone.min.js"></script>
    <SCRIPT src="../js/cornerstoneMath.js"></SCRIPT>
    <SCRIPT src="../js/cornerstoneTools.js"></SCRIPT>

    <!-- include the dicomParser library as the WADO image loader depends on it -->
    <script src="../js/dicomParser.min.js"></script>

    <!-- OpenJPEG based jpeg 2000 codec -->
    <script src="../js/libopenjpeg.js"></script>

    <!-- JPEG-LS codec -->
    <script src="../js/libCharLS.js"></script>

    <!-- PDF.js based jpeg 2000 codec -->
    <!-- NOTE: do not load the OpenJPEG codec if you use this one -->
    <!--<script src="../jpx.min.js"></script>-->

    <!-- include the cornerstoneWADOImageLoader library -->
    <script src="../js/cornerstoneWADOImageLoader.js"></script>

    <script src="../js/uids.js"></script>

    <script async>

        cornerstoneWADOImageLoader.configure({
            beforeSend: function (xhr) {
                // Add custom headers here (e.g. auth tokens)
                //xhr.setRequestHeader('x-auth-token', 'my auth token');
            }
        });

        var loaded = false;

        function loadAndViewImage(imageId) {
            var element = $('#dicomImage').get(0);
            try {
                var start = new Date().getTime();
                cornerstone.loadAndCacheImage(imageId).then(function (image) {
                    console.log(image);
                    var viewport = cornerstone.getDefaultViewportForImage(element, image);
                    $('#toggleModalityLUT').attr("checked", viewport.modalityLUT !== undefined);
                    $('#toggleVOILUT').attr("checked", viewport.voiLUT !== undefined);
                    cornerstone.displayImage(element, image, viewport);
                    if (loaded === false) {
                        cornerstoneTools.mouseInput.enable(element);
                        cornerstoneTools.mouseWheelInput.enable(element);
                        cornerstoneTools.wwwc.activate(element, 1); // ww/wc is the default tool for left mouse button
                        cornerstoneTools.pan.activate(element, 2); // pan is the default tool for middle mouse button
                        cornerstoneTools.zoom.activate(element, 4); // zoom is the default tool for right mouse button
                        cornerstoneTools.zoomWheel.activate(element); // zoom is the default tool for middle mouse wheel
                        loaded = true;
                    }

                    function getTransferSyntax() {
                        var value = image.data.string('x00020010');
                        return value + ' [' + uids[value] + ']';
                    }

                    function getSopClass() {
                        var value = image.data.string('x00080016');
                        return value + ' [' + uids[value] + ']';
                    }

                    function getPixelRepresentation() {
                        var value = image.data.uint16('x00280103');
                        if (value === undefined) {
                            return;
                        }
                        return value + (value === 0 ? ' (unsigned)' : ' (signed)');
                    }

                    function getPlanarConfiguration() {
                        var value = image.data.uint16('x00280006');
                        if (value === undefined) {
                            return;
                        }
                        return value + (value === 0 ? ' (pixel)' : ' (plane)');
                    }


                    $('#transferSyntax').text(getTransferSyntax());
                    $('#sopClass').text(getSopClass());
                    $('#samplesPerPixel').text(image.data.uint16('x00280002'));
                    $('#photometricInterpretation').text(image.data.string('x00280004'));
                    $('#numberOfFrames').text(image.data.string('x00280008'));
                    $('#planarConfiguration').text(getPlanarConfiguration());
                    $('#rows').text(image.data.uint16('x00280010'));
                    $('#columns').text(image.data.uint16('x00280011'));
                    $('#pixelSpacing').text(image.data.string('x00280030'));
                    $('#bitsAllocated').text(image.data.uint16('x00280100'));
                    $('#bitsStored').text(image.data.uint16('x00280101'));
                    $('#highBit').text(image.data.uint16('x00280102'));
                    $('#pixelRepresentation').text(getPixelRepresentation());
                    $('#windowCenter').text(image.data.string('x00281050'));
                    $('#windowWidth').text(image.data.string('x00281051'));
                    $('#rescaleIntercept').text(image.data.string('x00281052'));
                    $('#rescaleSlope').text(image.data.string('x00281053'));
                    $('#basicOffsetTable').text(image.data.elements.x7fe00010.basicOffsetTable ? image.data.elements.x7fe00010.basicOffsetTable.length : '');
                    $('#fragments').text(image.data.elements.x7fe00010.fragments ? image.data.elements.x7fe00010.fragments.length : '');
                    $('#minStoredPixelValue').text(image.minPixelValue);
                    $('#maxStoredPixelValue').text(image.maxPixelValue);
                    var end = new Date().getTime();
                    var time = end - start;
                    $('#loadTime').text(time + "ms");

                }, function (err) {
                    alert(err);
                });
            }
            catch (err) {
                alert(err);
            }
        }

        function downloadAndView() {
            var url = $('#wadoURL').val();

            // prefix the url with wadouri: so cornerstone can find the image loader
            url = "wadouri:" + url;


            // image enable the dicomImage element and activate a few tools
            loadAndViewImage(url);
        }

        $(cornerstone).bind('CornerstoneImageLoadProgress', function (eventData) {
            $('#loadProgress').text('Image Load Progress: ' + eventData.percentComplete + "%");
        });

        function getUrlWithoutFrame() {
            var url = $('#wadoURL').val();
            var frameIndex = url.indexOf('frame=');
            if (frameIndex !== -1) {
                url = url.substr(0, frameIndex - 1);
            }
            return url;
        }

        $(document).ready(function () {

            var element = $('#dicomImage').get(0);
            cornerstone.enable(element);

            downloadAndView();

            /*$('#downloadAndView').click(function(e) {
            downloadAndView();
            });*/
            $('#load').click(function (e) {
                var url = getUrlWithoutFrame();
                cornerstoneWADOImageLoader.dataSetCacheManager.load(url);
            });
            $('#unload').click(function (e) {
                var url = getUrlWithoutFrame();
                cornerstoneWADOImageLoader.dataSetCacheManager.unload(url);
            });

            $('#purge').click(function (e) {
                cornerstone.imageCache.purgeCache();
            });

            $('form').submit(function () {
                downloadAndView();
                return false;
            });

            $('#toggleModalityLUT').on('click', function () {
                var applyModalityLUT = $('#toggleModalityLUT').is(":checked");
                console.log('applyModalityLUT=', applyModalityLUT);
                var image = cornerstone.getImage(element);
                var viewport = cornerstone.getViewport(element);
                if (applyModalityLUT) {
                    viewport.modalityLUT = image.modalityLUT;
                } else {
                    viewport.modalityLUT = undefined;
                }
                cornerstone.setViewport(element, viewport);
            });

            $('#toggleVOILUT').on('click', function () {
                var applyVOILUT = $('#toggleVOILUT').is(":checked");
                console.log('applyVOILUT=', applyVOILUT);
                var image = cornerstone.getImage(element);
                var viewport = cornerstone.getViewport(element);
                if (applyVOILUT) {
                    viewport.voiLUT = image.voiLUT;
                } else {
                    viewport.voiLUT = undefined;
                }
                cornerstone.setViewport(element, viewport);
            });


        });

    </script>

    <script>
        $(document).ready(function () {
            $("#dicom").hide();

            setInterval(function () {
                if ($('#dicom').html().length != 0) {
                    $("#loading").hide();
                    $("#dicom").show();
                }
            }, 1000);
        });
    </script>

</body>
</html>
